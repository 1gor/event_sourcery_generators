# frozen_string_literal: true

module EventSourceryGenerators
  module Generators
    class Query < Thor::Group
      include Thor::Actions

      argument :query_name
      argument :event_names, type: :array, default: []

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates/query')
      end

      def create_query
        template('query.rb.tt', "app/projections/#{query_name}/query.rb")
      end

      def create_projector
        template('projector.rb.tt', "app/projections/#{query_name}/projector.rb")
      end

      def inject_query_to_api
        insert_into_file('app/web/server.rb', after: "< Sinatra::Base\n") do
          erb_file('api_endpoint.rb.tt')
        end
      end

      def add_projector_to_rakefile
        insert_into_file('Rakefile', erb_file('projector_process.tt'), after: "processors = [\n")
      end

      private

      def project_name
        @project_name ||= File.split(Dir.pwd).last
      end

      def project_class_name
        @project_class_name ||= project_name.underscore.camelize
      end

      def query_class_name
        @query_class_name ||= query_name.underscore.camelize
      end

      def erb_file(file)
        path = File.join(self.class.source_root, file)
        erb_content = ERB.new(::File.binread(path), trim_mode: "-", eoutvar: "@output_buffer")
        erb_content.result(binding)
      end
    end
  end
end

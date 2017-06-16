# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_sourcery_generators/version'

Gem::Specification.new do |spec|
  spec.name = 'event_sourcery_generators'
  spec.version = EventSourceryGenerators::VERSION
  spec.authors = ['Sebastian von Conrad']
  spec.email = ['sebastian.von.conrad@envato.com']

  spec.summary       = %q{Generators for EventSourcery}
  spec.description   = %q{}
  spec.homepage      = ''

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'activesupport', '~> 5.1'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'rspec', '~> 3.6'
end

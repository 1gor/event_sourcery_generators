$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'event_sourcery_generators'

Dir.glob(File.dirname(__FILE__) + '/support/**/*.rb') { |f| require f }

RSpec.configure do |config|
  config.disable_monkey_patching!
end

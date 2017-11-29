require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'lib/deal_with_it/version.rb'
end

require 'bundler/setup'

require 'deal_with_it'

SimpleCov.at_exit do
  SimpleCov.result.format!
end

SimpleCov.minimum_coverage 100

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

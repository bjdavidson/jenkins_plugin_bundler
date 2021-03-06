# frozen_string_literal: true
require 'json'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.disable_monkey_patching!

  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random

  Kernel.srand config.seed
end

def fixture_path(name)
  File.join(File.dirname(__FILE__), 'fixtures', name)
end

def json_fixture(plugin_name)
  path = fixture_path('update-center.json')
  JSON.parse(File.read(path))['plugins'][plugin_name]
end

require 'pry-byebug'
require_relative '../system/app'

require 'faker'
require 'warning'
require 'super_diff/rspec'

require 'dry/effects'

Dry::Effects.load_extensions(:rspec)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end

  config.disable_monkey_patching!

  config.warnings = true

  config.order = :random

  Kernel.srand config.seed

  config.backtrace_exclusion_patterns << /\/gems\//
  config.backtrace_exclusion_patterns << /\/spec_helper\.rb/
end
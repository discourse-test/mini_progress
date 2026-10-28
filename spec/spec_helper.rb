# frozen_string_literal: true

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start { add_filter "/spec/" }
end

require "mini_progress"

Dir[File.join(__dir__, "support", "**", "*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand(config.seed)

  config.expect_with(:rspec) { |c| c.syntax = :expect }

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

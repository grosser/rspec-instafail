require 'rspec/core/formatters/progress_formatter'

module RSpec
  class Instafail < RSpec::Core::Formatters::ProgressFormatter
    RSpec::Core::Formatters.register self, :example_failed

    def initialize(output)
      super
      @failed_examples = []
    end

    def example_failed(failure)
      @failed_examples << failure.example
      output.puts failure.fully_formatted(@failed_examples.size)
    end
  end
end

require 'rspec/core/formatters/progress_formatter'

module RSpec
  class Instafail < RSpec::Core::Formatters::ProgressFormatter
    def example_failed(example)
      # do what BaseFormatter#example_failed would do
      @failed_examples << example

      # do what BaseTextFormatter#dump_failures would do
      index = failed_examples.size - 1
      pending_fixed?(example) ? dump_pending_fixed(example, index) : dump_failure(example, index)
      dump_backtrace(example)
    end
  end
end

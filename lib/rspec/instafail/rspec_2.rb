require 'rspec/core/formatters/progress_formatter'

module RSpec
  class Instafail < RSpec::Core::Formatters::ProgressFormatter
    def example_failed(example)
      # do what BaseFormatter#example_failed would do
      @failed_examples << example

      # do what BaseTextFormatter#dump_failures would do
      index = failed_examples.size - 1
      _dump_pending_example(example, index)
      dump_backtrace(example)
    end

    private

    def _dump_pending_example(example, index)
      if defined? pending_fixed? # > 2.8
        if pending_fixed?(example)
          dump_pending_fixed(example, index)
        else
          preserve_size(example.example_group.ancestors) do
            dump_failure(example, index)
          end
        end
      else
        dump_pending_example_fixed(example, index) || dump_failure(example, index)
      end
    end

    def preserve_size(array)
      old = array.size
      yield
      array.pop if array.size > old
    end
  end
end

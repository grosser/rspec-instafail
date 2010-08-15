module RSpec
  if defined? Spec
    # rspec 1.x
    require 'spec/runner/formatter/progress_bar_formatter'
    class Instafail < Spec::Runner::Formatter::ProgressBarFormatter
      def example_failed(example, counter, failure)
        output.puts
        output.puts red("#{counter}: #{example_group.description} #{example.description}")
        output.puts " -> #{failure.exception}"
        output.flush
      end
    end
  else
    # rspec 2.x
    require 'rspec'
    require 'rspec/core/formatters/progress_formatter'
    class Instafail < RSpec::Core::Formatters::ProgressFormatter
      def example_failed(example)
        @counter ||= 0
        @counter += 1
        output.puts
        output.puts red("#{@counter}: #{example.example_group.description} #{example.description}")
        output.puts " -> #{example.metadata[:execution_result][:exception_encountered]}"
        output.flush
      end
    end
  end
end
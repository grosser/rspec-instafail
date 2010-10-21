module RSpec
  klass = if defined? Spec
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
    Instafail
  else
    # rspec 2.x
    require 'rspec'
    require 'rspec/core/formatters/progress_formatter'
    class Instafail < RSpec::Core::Formatters::ProgressFormatter
      def example_failed(example)
        @counter ||= 0
        @counter += 1
        exception = example.metadata[:execution_result][:exception_encountered]
        short_padding = '  '
        padding = '     '
        output.puts
        output.puts "#{@counter}) #{example.full_description}"
        output.puts "#{padding}#{red("Failure/Error:")} #{red(read_failed_line(exception, example).strip)}"
        output.puts "#{padding}#{exception}"
        format_backtrace(exception.backtrace, example).each do |backtrace_info|
          output.puts grey("#{padding}# #{backtrace_info}")
        end
        output.flush
      end
    end
    Instafail
  end

  klass::VERSION = File.read( File.join(File.dirname(__FILE__),'..','..','VERSION') ).strip
end
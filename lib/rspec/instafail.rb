module RSpec
  klass = if defined? Spec
    # rspec 1.x
    require 'spec/runner/formatter/progress_bar_formatter'
    Spec::Runner::Formatter::ProgressBarFormatter
  else
    # rspec 2.x
    require 'rspec/core/formatter/progress_formatter'
    RSpec::Core::Formatters::ProgressFormatter
  end

  class Instafail < klass
    def example_failed(example, counter, failure)
      output.puts
      output.puts red("#{counter}: #{example_group.description} #{example.description}")
      output.puts " -> #{failure.exception}"
      output.flush
    end
  end
end
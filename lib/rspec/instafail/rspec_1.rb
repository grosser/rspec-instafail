require 'spec/runner/formatter/progress_bar_formatter'

module RSpec
  class Instafail < Spec::Runner::Formatter::ProgressBarFormatter
    def example_failed(example, counter, failure)
      dump_failure(counter, failure)
    end
  end
end

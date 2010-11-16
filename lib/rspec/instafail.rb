module RSpec
  begin
    # rspec 2.x
    require 'rspec/core/formatters/progress_formatter'
    require 'rspec/instafail/rspec_2'
  rescue LoadError => try_rspec_1
    # rspec 1.x
    require 'spec/runner/formatter/progress_bar_formatter'
    require 'rspec/instafail/rspec_1'
  end

  Instafail::VERSION = File.read( File.join(File.dirname(__FILE__),'..','..','VERSION') ).strip
end

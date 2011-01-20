module RSpec
  begin
    require File.dirname(__FILE__) + '/instafail/rspec_2'
  rescue LoadError # try rspec 1
    require File.dirname(__FILE__) + '/instafail/rspec_1'
  end

  Instafail::VERSION = File.read( File.join(File.dirname(__FILE__),'..','..','VERSION') ).strip
end

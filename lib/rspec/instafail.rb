module RSpec
  # Rails 3: when installed as plugin, lib is not in load-path when running tests
  # https://github.com/grosser/rspec-instafail/pull/3
  lib = File.expand_path(File.dirname(File.dirname(__FILE__)))
  $LOAD_PATH << lib unless $LOAD_PATH.include?(lib)

  if defined?(::RSpec::Core)
    if ::RSpec::Core::Version::STRING >= '3.0.0'
      require "rspec/instafail/rspec_3"
    else
      require "rspec/instafail/rspec_2"
    end
  else
    require "rspec/instafail/rspec_1"
  end

  require 'rspec/instafail/version'
end

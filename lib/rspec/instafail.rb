module RSpec
  version = Gem.loaded_specs["rspec-core"].version
  require "rspec/instafail/rspec_#{[3, version.segments.first].min}"
rescue
  require "rspec/instafail/rspec_1"
end

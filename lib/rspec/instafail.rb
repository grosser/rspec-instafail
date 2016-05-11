module RSpec
  version = Gem.loaded_specs["rspec-core"].version
  require "rspec/instafail/rspec_#{[3, version.segments.first].min}"
end

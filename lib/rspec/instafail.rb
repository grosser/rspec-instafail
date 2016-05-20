module RSpec
  gem_spec = Gem::Specification.find_all_by_name('rspec-core').first
  if gem_spec
    version = gem_spec.version
    require "rspec/instafail/rspec_#{[3, version.segments.first].min}"
  else
    require "rspec/instafail/rspec_1"
  end
end

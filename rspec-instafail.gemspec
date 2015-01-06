name = 'rspec-instafail'
require './lib/rspec/instafail/version'

Gem::Specification.new name, RSpec::Instafail::VERSION do |s|
  s.summary = "Show failing specs instantly"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib Readme.md`.split("\n")
  s.license = "MIT"
  s.add_runtime_dependency "rspec"
end

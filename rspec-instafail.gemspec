$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
name = 'rspec-instafail'
require "rspec/instafail/version"

Gem::Specification.new name, RSpec::Instafail::VERSION do |s|
  s.summary = "Show failing specs instantly"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/#{name}"
  s.files = `git ls-files`.split("\n")
  s.license = "MIT"

  s.add_dependency 'rspec-core', '>= 2.8.0'
end

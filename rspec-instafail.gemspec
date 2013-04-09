$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
name = 'rspec-instafail'

# needs rspec installed to load the version, so let's avoid this mess
version = File.read("lib/rspec/instafail/version.rb")[/\d+\.\d+\.\d+/]

Gem::Specification.new name, version do |s|
  s.summary = "Show failing specs instantly"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/#{name}"
  s.files = `git ls-files`.split("\n")
  s.license = "MIT"
  s.add_runtime_dependency "rspec"
end

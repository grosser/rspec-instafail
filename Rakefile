require "bundler"
Bundler::GemHelper.install_tasks

task :default do
  sh "cd spec/rspec_1 && (bundle || bundle install) > /dev/null"
  sh "cd spec/rspec_2 && (bundle || bundle install) > /dev/null"
  sh "rspec spec/"
end

rule /^version:bump:.*/ do |t|
  file = 'lib/rspec/instafail/version.rb'

  sh "git status | grep 'nothing to commit'" # ensure we are not dirty
  index = ['major', 'minor','patch'].index(t.name.split(':').last)

  version_file = File.read(file)
  old_version, *version_parts = version_file.match(/(\d+)\.(\d+)\.(\d+)/).to_a
  version_parts[index] = version_parts[index].to_i + 1
  version_parts[2] = 0 if index < 2
  version_parts[1] = 0 if index < 1
  new_version = version_parts * '.'
  File.open(file,'w'){|f| f.write(version_file.sub(old_version, new_version)) }

  sh "git add #{file} && git commit -m 'bump version to #{new_version}'"
end

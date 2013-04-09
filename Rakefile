require "bundler/setup"
require "bundler/gem_tasks"
require "bump/tasks"

task :default do
  sh "cd spec/rspec_1 && (bundle check || bundle) > /dev/null"
  sh "cd spec/rspec_2 && (bundle check || bundle) > /dev/null"
  sh "rspec spec/"
end

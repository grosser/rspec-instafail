require "bundler/setup"
require "bundler/gem_tasks"
require "bump/tasks"

task :default do
  Bundler.with_clean_env do
    sh "cd spec/rspec_1 && (bundle check || bundle) > /dev/null"
    sh "cd spec/rspec_2 && (bundle check || bundle) > /dev/null"
    sh "cd spec/rspec_3 && (bundle check || bundle) > /dev/null"
  end
  sh "rspec spec/instafail_spec.rb"
end

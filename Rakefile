require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'wwtd/tasks'
require 'bump/tasks'

namespace :app do
  load 'spec/dummy/Rakefile'
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'rubygems'
require 'bundler'
require 'cucumber/rake/task'

Bundler::GemHelper.install_tasks
Cucumber::Rake::Task.new

task :default => :cucumber

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be
# available to Rake.

task default: [:test]

task test: [:travis_lint, :rubocop, :reek]

task :travis_lint do
  sh 'travis-lint'
end

task :rubocop do
  sh 'rubocop . Rakefile'
end

task :reek do
  sh 'reek . Rakefile'
end

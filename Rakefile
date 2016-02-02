# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be
# available to Rake.

task default: :test

task test: [:rubocop, :reek, :scss_lint]

task :rubocop do
  sh 'rubocop Gemfile Rakefile yamlcss.gemspec lib/'
end

task :reek do
  sh 'reek -c config/defaults.reek Appraisals Gemfile Rakefile ' \
    'yamlcss.gemspec lib/'
end

task :scss_lint do
  sh 'scss-lint vendor/assets/stylesheets/'
end

# Needed for pre-3.1.

require 'fileutils'
require 'find'

namespace :yamlcss do
  desc 'Move files to the YAML assets directory.'
  task :install, [:sass_path] do |t, args|
    args.with_defaults(:sass_path => 'public/stylesheets/sass')
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    FileUtils.mkdir_p("#{Rails.root}/#{args.sass_path}/yaml")
    FileUtils.cp_r("#{source_root}/yaml/sass/yaml-sass/.", "#{Rails.root}/#{args.sass_path}/yaml", { :preserve => true })
    Find.find("#{Rails.root}/#{args.sass_path}/yaml") do |path|
      if path.end_with?(".css.scss")
        path_without_css_extension = path.gsub(/\.css\.scss$/, ".scss")
        FileUtils.mv(path, path_without_css_extension)
      end
    end
  end
end

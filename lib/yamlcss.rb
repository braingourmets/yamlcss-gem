# CodeKit needs relative paths
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require 'yamlcss/generator'

unless defined?(Sass)
  require 'sass'
end

module Yamlcss
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require 'yamlcss/engine'
    end
  else
    Sass.load_paths << File.expand_path('../../vendor/assets/stylesheets', __FILE__)
  end
end

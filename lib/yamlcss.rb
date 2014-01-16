# CodeKit needs relative paths.
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require 'yamlcss/generator'

require 'sass' unless defined?(Sass)

# Check if Rails and Rails Engine is defined and define Sass load path.
module YamlCss
  if defined?(Rails) && defined?(Rails::Engine)
    # Define Engine for Rails version > 3.2 and < 4.0.
    class Engine < ::Rails::Engine
      require 'yamlcss/engine'
    end
  else
    Sass.load_paths << File.expand_path(
      '../../vendor/assets/stylesheets',
      __FILE__
    )
  end
end

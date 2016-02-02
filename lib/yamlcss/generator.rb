require 'yamlcss/version'
require 'fileutils'
require 'thor'

# YAML generator with install methods.
module YamlCss
  # Use Thor for own generator.
  class Generator < Thor
    map %w(-v --version) => :version

    desc 'install', 'Install YAML into your project'
    method_options path: :string, force: :boolean
    def install
      if yaml_files_already_exist? && !options[:force]
        puts 'YAML files already installed, doing nothing.'
      else
        install_files
        puts "YAML files installed to #{install_path}/"
      end
    end

    desc 'update', 'Update Bourbon'
    method_options path: :string
    def update
      if yaml_files_already_exist?
        remove_yaml_directory
        install_files
        puts 'YAML files updated.'
      else
        puts 'No existing YAML installation. Doing nothing.'
      end
    end

    desc 'version', 'Show YAML version'
    def version
      say "YAML #{YamlCss::VERSION}"
    end

    private

    def yaml_files_already_exist?
      install_path.exist?
    end

    def install_path
      options_path = options[:path]
      new_install_path = if options_path
                           Pathname.new(File.join(options_path, 'yaml'))
                         else
                           Pathname.new('yaml')
                         end
      @install_path ||= new_install_path
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    ##
    # Removes the yaml directory.
    #
    # @return [void]
    def remove_yaml_directory
      FileUtils.rm_rf('yaml')
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(Generator.all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{Generator.stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(Generator.top_level_directory, 'yaml')
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end

require 'yamlcss/version'
require 'fileutils'
require 'thor'

module Yamlcss
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'install', 'Install YAML into your project'
    method_options :path => :string, :force => :boolean
    def install
      if yaml_files_already_exist? && !options[:force]
        puts 'YAML files already installed, doing nothing.'
      else
        install_files
        puts "YAML files installed to #{install_path}/"
      end
    end

    desc 'update', 'Update Bourbon'
    method_options :path => :string
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
      say "YAML #{Yamlcss::VERSION}"
    end

    private

    def yaml_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], 'yaml'))
        else
          Pathname.new('yaml')
        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_yaml_directory
      FileUtils.rm_rf('yaml')
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, 'app', 'assets', 'stylesheets')
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end

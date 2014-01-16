# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'yamlcss/version'

Gem::Specification.new do |s|
  s.name        = 'yamlcss'
  s.version     = YamlCss::VERSION
  s.date        = '2014-01-08'
  s.summary     = 'YAML CSS Framework'
  s.description = 'A modular CSS framework for truly flexible, ' +
                  'accessible and responsive websites'
  s.authors     = ['Dirk Jesse']
  s.email       = 'office@highresolution.info'
  s.files       = ['lib/yamlcss.rb']
  s.homepage    = 'http://www.yaml.de/'
  s.license     = 'CC-BY 2.0'
  s.add_dependency 'sass', '~> 3.2.12'
  s.add_dependency 'thor'

  s.add_development_dependency 'aruba', '~> 0.4'
  s.add_development_dependency 'rake'

  s.rubyforge_project = 'yamlcss'

  s.files         = `find . | grep -v "/.git"`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n")
    .map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
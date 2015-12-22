# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'yamlcss/version'

Gem::Specification.new do |s|
  s.name                  = 'yamlcss'
  s.version               = YamlCss::VERSION
  s.date                  = '2014-01-17'
  s.summary               = 'YAML CSS Framework'
  s.description           = 'A modular CSS framework for truly flexible, ' \
                            'accessible and responsive websites'
  s.authors               = ['Michael Schulze', 'Oliver Klee']
  s.email                 = 'm.schulze@braingourmets.com'
  s.files                 = ['lib/yamlcss.rb']
  s.homepage              = 'https://github.com/braingourmets/yamlcss-gem'
  s.license               = 'CC-BY 2.0'
  s.required_ruby_version = '>= 2.0.0'
  s.post_install_message  = 'Thank you for installing YAML!'

  s.add_dependency 'sass'
  s.add_dependency 'thor'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'reek'
  s.add_development_dependency 'scss-lint'

  s.files         = `find . | grep -v "/.git"`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n")
                    .map { |f| File.basename(f) }
  s.require_paths = ['lib']
end

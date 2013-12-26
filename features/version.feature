@disable-bundler
Feature: Show version
  Scenario: Viewing version
    When I successfully run `bundle exec yamlcss --version`
    Then the output should contain the current version of YAML


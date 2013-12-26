@disable-bundler
Feature: Install YAML files

  Scenario: yamlcss generates a new YAML installation
    When I run `bundle exec yamlcss install`
    Then the sass directories should have been generated
    And the following directories should exist:
      | yaml     |
    And the master yaml partial should have been generated
    And the output should contain "YAML files installed to yaml/"

  Scenario: Generating does not overwrite an existing yaml directory
    Given YAML is already installed
    When I run `bundle exec yamlcss install`
    Then the output should contain "YAML files already installed, doing nothing."

  Scenario: Install YAML into a custom path
    When I run `bundle exec yamlcss install --path=custom_path`
    Then the sass directories with "custom_path" prefix should have been generated
    And the following directories should exist:
      | custom_path/yaml     |
    And the master yaml partial should have been generated within "custom_path" directory
    And the output should contain "YAML files installed to custom_path/yaml/"

  Scenario: Forcing install of YAML
    Given YAML is already installed
    When I run `bundle exec yamlcss install --force`
    Then the output from "bundle exec yamlcss install --force" should contain "YAML files installed to yaml/"
    And the output should not contain "YAML files already installed, doing nothing."

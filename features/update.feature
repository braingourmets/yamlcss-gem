@disable-bundler
Feature: Update YAML files

  Scenario: Updating updates an existing yamlcss install
    Given YAML is already installed
    When I write to "yaml/_yaml-var-globals.scss" with:
      """
      foobar
      """
    And I run `bundle exec yamlcss update`
    Then the output should contain "YAML files updated."
    And the file "yaml/_yaml-var-globals.scss" should not contain "foobar"

  Scenario: Updating with a --path option
    Given I install YAML to "custom_path"
    When I write to "custom_path/yaml/_yaml-var-globals.scss" with:
      """
      foobar
      """
    And I run `bundle exec yamlcss update`
    Then the output should contain "No existing YAML installation. Doing nothing."

    When I run `bundle exec yamlcss update --path custom_path`
    Then the output should contain "YAML files updated."
    And the file "custom_path/yaml/_yaml-var-globals.scss" should not contain "foobar"

  Scenario: Updating does not generate a new yamlcss install
    And I run `bundle exec yamlcss update`
    Then yaml should not have been generated
    And the output should contain "No existing YAML installation. Doing nothing."

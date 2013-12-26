Given /^yaml is already installed$/ do
  install_yaml
end

Given /^I install yaml to "([^"]*)"$/ do |path|
end

Then /^the sass directories(?: with "([^"]+)" prefix)? should have been generated$/ do |prefix|
  sass_directories = ["core", "screen", "print"]
  sass_directories.map!{ |directory| yaml_path(prefix, directory) }
  check_directory_presence(sass_directories, true)
end

Then /^the master yaml partial should have been generated(?: within "([^"]+)" directory)?$/ do |prefix|
  check_file_presence([yaml_path(prefix, '_yaml-var-globals.scss')], true)
end

Then /^yaml should not have been generated$/ do
  check_directory_presence(['yaml'], false)
end

Then /^the output should contain the current version of YAML$/ do
  step %(the output should contain exactly "YAML #{YAML::VERSION}\n")
end

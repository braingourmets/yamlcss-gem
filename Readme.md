# YAML CSS Framework as Gem for Ruby on Rails

[![Build Status](https://travis-ci.org/braingourmets/yamlcss-gem.png?branch=master)](https://travis-ci.org/braingourmets/yamlcss-gem)
[![Code Climate](https://codeclimate.com/github/braingourmets/yamlcss-gem.png)](https://codeclimate.com/github/braingourmets/yamlcss-gem)
[![Gem Version](https://badge.fury.io/rb/yamlcss.png)](http://badge.fury.io/rb/yamlcss)

YAML (*Yet Another Multicolumn Layout*) is a modular CSS framework for truly
flexible, accessible and responsive websites. YAML is focussed on device
independent screen design and provides bullet-proof modules for flexible
layouts. This is a perfect starting point and the key to truly responsive
design.

* Latest version: 4.1.2
* Website: http://www.yaml.de

## Documentation

### Requirements

* Ruby >= 1.9.3

* Sass 3.2+ (if you want to use YAML Sass files)

## Install for Rails 3.1+

In your Gemfile:

    gem 'yamlcss'

Then run:

    $ bundle install

Restart your server. Then rename application`.css` to application`.css.scss`:

    mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss

Import YAML at the beginning of application.css.scss. All additional
stylesheets must be imported below YAML:

    @import "yaml";

## Non-Rails projects

YAML includes an easy way to generate a directory with all the necessary
files.
For command line help: `$ yaml help`

### Install (YAML v4.1+)

    gem install yamlcss

Install YAML into the current directory by generating the `yaml` folder:

    yaml install

The generated folder will contain all the YAML files (CSS & Sass). It is
recommended not to add or modify the YAML files so that you can update YAML
easily.

You can specify a target directory using the `path` flag:

    yaml install --path my/custom/path/

### Import Sass

Lastly, import the YAML core at the beginning of your stylesheet(s):

    @import 'yaml/sass/yaml-sass/core/base';

For your IE hacks stylesheet, use:

    @import 'yaml/sass/yaml-sass/core/iehacks';

### Import CSS

If you're still using pure CSS, you'll find the important files in the
directory *yaml/yaml*:

    @import url("yaml/yaml/core/base.min.css");

License
-------

YAML Gem is Copyright (c) 2014 Brain Gourmets GmbH. It is free software, and
may be redistributed under the terms specified in the LICENSE.txt file.

License for the YAML framework
------------------------------

Copyright (c) 2005-2013 Dirk Jesse

### YAML under Creative Commons License (CC-BY 2.0)

The YAML framework is published under the [Creative Commons Attribution 2.0
License (CC-BY 2.0)](http://creativecommons.org/licenses/by/2.0/), which
permits both private and commercial use.

*Condition: For the free use of the YAML framework, a backlink to the YAML
homepage (<http://www.yaml.de>) in a suitable place (e.g.: footer of the
website or in the imprint) is required.*

In general it would be nice to get a short note when new YAML-based projects
are released. If you are highly pleased with YAML, perhaps you would like to
take a look at my
[Amazon wish](https://www.amazon.de/gp/registry/wishlist/108Q0YYJ49UC2/) list?

### YAML under Commercial Distribution License (YAML-CDL)

If you are a commercial software developer and you want to release your
software under a license that doesn't fit to the [Creative Commons
Attribution 2.0 License](http://creativecommons.org/licenses/by/2.0/), you may
purchase a commercial license. We offer the following commercial license
models:

- Project Related License
- General License
- OEM License

Full license texts and contact information are available at:
<http://www.yaml.de/license.html>

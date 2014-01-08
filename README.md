# Mutiny [![Build Status](https://travis-ci.org/louismrose/mutiny.png?branch=master)](https://travis-ci.org/louismrose/mutiny) [![Code Climate](https://codeclimate.com/github/louismrose/mutiny.png)](https://codeclimate.com/github/louismrose/mutiny) [![Dependency Status](https://gemnasium.com/louismrose/mutiny.png)](https://gemnasium.com/louismrose/mutiny) [![Coverage Status](https://coveralls.io/repos/louismrose/mutiny/badge.png?branch=master)](https://coveralls.io/r/louismrose/mutiny?branch=master)

A tiny mutation testing framework.

#### Usage
* `git clone` this repo
* `bundle install`
* `ruby lib/driver.rb examples/<EXAMPLE_NAME>`

#### To do list
* Adapt framework to run Java, and add Java versions of the examples
* Extend framework to generate mutants at runtime using simple string substitution and some simple mutation operators
* Extend framework to run tests using the RSpec / JUnit APIs
* Extend framework to explore Program Analyser and more sophisticated Test Case Provider components (see OmniGraffle diagram)

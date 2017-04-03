require "simplecov"
require "coveralls"
SimpleCov.start { add_filter '/spec/' }
Coveralls.wear!

require "pakiderm"
require "rspec/given"
require "support/counter"

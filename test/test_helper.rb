# Add simplecov
require 'simplecov'
SimpleCov.start do
    add_filter 'test/' 
end
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require 'date'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/calendar'
require_relative '../lib/hotel_booker'
require_relative '../lib/reservation'

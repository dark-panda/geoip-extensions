# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'
require 'minitest/reporters'
require File.join(File.dirname(__FILE__), %w{ .. lib geoip-extensions })

module TestHelper
  CITY_DB = begin
    GeoIP::City.new(ENV['GEOIP_DB'])
  rescue
    raise "You must supply a path to a GeoIP database using the GEOIP_DB environment variable."
  end
end

MiniTest::Reporters.use!(MiniTest::Reporters::SpecReporter.new)


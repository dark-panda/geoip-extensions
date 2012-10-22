# encoding: UTF-8

require 'rubygems'
require 'minitest/autorun'
require 'turn/autorun'
require File.join(File.dirname(__FILE__), %w{ .. lib geoip-extensions })

module TestHelper
  CITY_DB = begin
    GeoIP::City.new(ENV['GEOIP_DB'])
  rescue
    raise "You must supply a path to a GeoIP database using the GEOIP_DB environment variable."
  end
end

if ENV['autotest']
  module Turn::Colorize
    def self.color_supported?
      true
    end
  end
end

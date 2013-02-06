# encoding: UTF-8

if RUBY_VERSION >= '1.9'
  require 'simplecov'

  SimpleCov.command_name('Unit Tests')
  SimpleCov.start do
    add_filter '/test/'
  end
end

require 'rubygems'
require 'minitest/autorun'

if RUBY_VERSION >= '1.9'
  require 'minitest/reporters'
end

require File.join(File.dirname(__FILE__), %w{ .. lib geoip-extensions })

puts "Ruby version #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} - #{RbConfig::CONFIG['RUBY_INSTALL_NAME']}"

module TestHelper
  CITY_DB = begin
    GeoIP::City.new(ENV['GEOIP_DB'])
  rescue
    raise "You must supply a path to a GeoIP database using the GEOIP_DB environment variable."
  end
end

if RUBY_VERSION >= '1.9'
  MiniTest::Reporters.use!(MiniTest::Reporters::SpecReporter.new)
end


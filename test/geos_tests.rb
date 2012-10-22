# encoding: UTF-8

$: << File.dirname(__FILE__)
require 'test_helper'

class GeosTests < MiniTest::Unit::TestCase
  include TestHelper

  def test_geos
    city = CITY_DB.look_up('24.24.24.24')

    if city && city[:latitude] && city[:longitude]
      assert(city[:geom])
    else
      skip("Couldn't find a location in this GeoIP database for 24.24.24.24.")
    end
  end
end

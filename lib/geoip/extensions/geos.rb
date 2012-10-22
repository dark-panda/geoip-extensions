
require 'ffi-geos'

module GeoIP
  module Extensions
    module Geos
      def self.included(base)
        base.class_eval do
          alias :look_up_without_geos :look_up
          alias :look_up :look_up_with_geos
        end
      end

      def look_up_with_geos(*args)
        look_up_without_geos(*args).tap do |ret|
          if ret && ret[:latitude] && ret[:longitude]
            ret[:geom] = ::Geos.create_point(::Geos::CoordinateSequence.new([ ret[:longitude], ret[:latitude] ]))
          end
        end
      end
    end
  end
end

class GeoIP::City
  include GeoIP::Extensions::Geos
end

module Breeding
  module Bus
    class Seat
    	attr_reader :x, :y

      def initialize(x, y)
    		@x, @y = x, y
    	  @@width, @@length = 7, 10
      end

      def width
        @@width
      end

      def length
        @@length
      end

      def contains(a)
        if @x == a.x && @y == a.y
          return true
        end
        return false
      end
      
    end
  end
end

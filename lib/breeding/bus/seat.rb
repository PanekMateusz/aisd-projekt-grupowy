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
    end
  end
end

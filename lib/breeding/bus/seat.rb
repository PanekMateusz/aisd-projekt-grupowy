module Breeding
  module Bus
    class Seat
    	attr_reader :x, :y

    	def initialize(x, y)
    		@x, @y = x, y
    	end
    end
  end
end

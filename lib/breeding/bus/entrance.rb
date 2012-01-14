module Breeding
  module Bus
    class Entrance
    	attr_reader :x, :y
    	
    	def initialize(x, y)
    		@x, @y = x, y
    		@@width, @@length = 10, 15 
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

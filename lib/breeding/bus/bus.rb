#module Breeding
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

      def equals(s)
        if @x==s.x && @y==s.y
          return true
        end
          false
      end
    end


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



 # module Bus
    class Bus
      
      attr_reader :length, :passengers
      
      def initialize(value)
        @@price = value;
        @@width = 35; #stała szerokość autobusu DO USTALENIA!
        @entrances = []
        @seats = []

        
        floor_price = 1000 #cena kwadracika 70x100 bez siedzenia
        seat_price = 1500 #cena kwadracika 70x100 z siedzeniem
        seats_prc = (5+Random.rand(65)) #procent miejsca zajętego przez siedzienia 
        seats_nb = (@@price*seats_prc/100)/seat_price
        puts seats_nb

        @length= ((((@@price-(seat_price*seats_nb))/floor_price) + seats_nb)/5)*10
        
        
        generate_entrances
        generate_seats(seats_nb)
        @seats.sort! do |a,b|
          comp = (a.y <=> b.y)
          comp.zero? ? (a.x <=> b.x) : comp
        end

      end

      def seats_length
        @seats.length
      end

      def entrances_length
        @entrances.length
      end

      def entrances( x )
        @entrances[x]
      end

      def seats( x )
        @seats[x]
      end


    private

      def generate_entrances
         #TO_DO losowanie liczby i miejsca wejsc
        entrance_nb = 2 + rand(2) #2 lub 3 wejscia
        puts entrance_nb
        coords = ((((@length/10)/entrance_nb)/2)-1)
        for i in 0..entrance_nb-1
          @entrances.push( Entrance.new( (coords+i*((@length/10)/entrance_nb))*10 , 28 ))
        end
      end

      def generate_seats(seats_nb)
        
        block_nb= @length/10 * 5  #ilosc blokow 7x10
        flag=0
        
        seats_nb.times do
          block= rand(block_nb-1)   # losowanie bloku w ktore wstawiamy siedzenie
          y= (block/(@length/10))*7  # Wyliczanie wspolrzednych wylosowanego bloku
          x= (block%(length/10))*10
          if y != 28
            a= Seat.new( x , y)
            if !contains(a)
              @seats.push(a)
            end
            
          else
            
            for j in 0..@entrances.length-1
              if x == (@entrances[j].x) || x == ((@entrances[j].x+10))
                flag=1
                break
              end
            end
            if flag == 0
              a= Seat.new( x , y)
              if !contains(a)
                @seats.push(a)
              end
            
            end
            flag=0   
          end
        end
      end  

      def contains(a)
        for i in 0..@seats.length-1
          if @seats[i].equals(a)
            return true
          end
        end
        false
      end
    end
 # end
#end
cena=100000
bus = Bus.new(cena)



#wyswitlanie ASCII busa
k=0
l=0

entr = []
for i in 0..bus.entrances_length-1
  entr.push(bus.entrances(i).x/10)
  entr.push((bus.entrances(i).x+10)/10)
end

for i in 0..bus.seats_length-1
  puts
  puts bus.seats(i).x
  puts bus.seats(i).y
end


for i in 0..4
  str='-' * (bus.length/10*2)
  puts str
  str=''
  for j in 0..bus.length/10*2
    if j%2 ==0
        str = str + "|"

    elsif i == 4
      if j/2 == entr[k] 
        str = str + 'D'
        k = k+1
      elsif l < bus.seats_length && j/2 == (bus.seats(l).x/10)
        str = str + "S"
          l = l+1        
      else
        str = str + ' '
      end

    elsif i == (bus.seats(l).y/7)
      if l < bus.seats_length && j/2 == (bus.seats(l).x/10)
        str = str + "S"
          l = l+1
      else
        str = str + " "
      end
    else
        str = str + " "
    end
  end
  puts str
end
str='-' * (bus.length/10*2)
  puts str

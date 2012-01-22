module Breeding
  module Bus
    class Bus
      
      attr_reader :length, :passengers
      
      def initialize(value , seats , entrances , length)
        @@width=35          #baby bus
        @@price= value
        @seats=seats
        @entrances = entrances
        @length = length
        if @seats == nil   #swierzy bus
          @entrances = []
          @seats = []
          floor_price = 1000                        #cena kwadracika 70x100 bez siedzenia
          seat_price = 1500                         #cena kwadracika 70x100 z siedzeniem
          seats_prc = (5+Random.rand(65))           #procent miejsca zajętego przez siedzienia 
          seats_nb = (@@price*seats_prc/100)/seat_price  #ilosc siedzen do wygenerowania (bedzie mniejsza jezeli siedzenia sie powtarzaja)
        

          @length= ((((@@price-(seat_price*seats_nb))/floor_price) + seats_nb)/5)*10  #dlugosc autobusu
        
          generate_entrances
          generate_seats(seats_nb)

          @seats.sort! do |a,b|                   #sortowanie tablicy z siedzeniami najpierw po Y potem po X
            comp = (a.y <=> b.y)
            comp.zero? ? (a.x <=> b.x) : comp
          end
        end
      end

#dostep do tablic gdyz kompilator plul sie o attr_reader
      def seats_length
        @seats.length
      end

      def entrances_length
        @entrances.length
      end

      def entrances_array
        @entrances
      end

      def entrances( x )
        @entrances[x]
      end

      def seats( x )
        @seats[x]
      end

      def mutate
      #mutuj autobus
        block_nb= @length/10 * 5

        mutation = @seats.length*rand(11)/100
        mutation.times do 
          mutate_seat = rand(@seats.length)
          block= rand(block_nb-1)                     # losowanie bloku w ktore wstawiamy siedzenie
          y= (block/(@length/10))*7                    # Wyliczanie wspolrzednych wylosowanego bloku
          x= (block%(length/10))*10
          a= Seat.new(x, y)

          flag = 0
          if y == 28
            for i in 0..entrances_length-1
              if x == (@entrances[i].x) || x == ((@entrances[i].x+10))
                flag = 1
              end
            end
          end
          if flag == 0
            if !contains(a)                           # nie wrzucaj powtarzajacych sie siedzen
              @seats[mutate_seat]=a
            else
              @seats.delete_at mutate_seat            #usun siedzenie jezeli przy mutacji trafi na zajete miejsce
            end
          else
            @seats.delete_at mutate_seat
          end

          flag=0

        end

        @seats.sort! do |a,b|                   #sortowanie tablicy z siedzeniami najpierw po Y potem po X
          comp = (a.y <=> b.y)
          comp.zero? ? (a.x <=> b.x) : comp
        end

      end

#plodzenie autobusow
      def reproduce( bus )
        baby_seats = []
        baby_entrances = []
        flag=0

        if @length >= bus.length
          baby_length = @length
        else
          baby_length = bus.length
        end

        if rand(2) == 1                 #losuj od kogo dziedziczy drzwi
          baby_entrances = @entrances
        else
          baby_entrances = bus.entrances_array
        end


        @seats.each do |seat|             #losuj czy dziedziczysz siedzenie z mamusi
          if rand(100) < 60
            flag = 0

            for j in 0..@entrances.length-1           #sprawdz czy siedzenie nie stoi w drzwiach
              if seat.x == (@entrances[j].x) || seat.x == ((@entrances[j].x+10))
                flag=1
                break
              end
            end
            if flag ==0
              baby_seats.push( seat )
            end
            flag =0
          end
        end
        
        for i in 0..bus.seats_length-1                   #losuj czy dziedziczysz siedzenie z tatusia
          flag=0
          if rand(100) < 60
            con_flag = false
            for j in 0..baby_seats.length-1
              if baby_seats[j].equals(bus.seats(i))
                con_flag = true
              end
            end
            if !con_flag
              for j in 0..@entrances.length-1           #sprawdz czy siedzenie nie stoi w drzwiach
                if bus.seats(i).x == (@entrances[j].x) || bus.seats(i).x == ((@entrances[j].x+10))
                  flag=1
                  break
                end
              end
              if flag==0 
                baby_seats.push(bus.seats(i))
              end
              con_flag=false
              flag=0
            end
          end
        end

        baby_seats.sort! do |a,b|                   #sortowanie tablicy z siedzeniami najpierw po Y potem po X
          comp = (a.y <=> b.y)
          comp.zero? ? (a.x <=> b.x) : comp
        end

        Bus.new(@@price , baby_seats , baby_entrances , baby_length)
      end

    private

#GENEROWANIE LOSOWYCH WEJSC
      def generate_entrances                
        entrance_nb = 2 + rand(2)                     #2 lub 3 wejscia
        coords = ((((@length/10)/entrance_nb)/2)-1)
        for i in 0..entrance_nb-1
          @entrances.push( Entrance.new( (coords+i*((@length/10)/entrance_nb))*10 , 28 ))
        end
      end


#GENEROWANIE LOSOWYCH SIEDZEN
      def generate_seats(seats_nb)
        
        block_nb= @length/10 * 5                       #ilosc blokow 7x10
        flag=0
        
        seats_nb.times do
          block= rand(block_nb-1)                     # losowanie bloku w ktore wstawiamy siedzenie
          y= (block/(@length/10))*7                    # Wyliczanie wspolrzednych wylosowanego bloku
          x= (block%(length/10))*10
          if y != 28
            a= Seat.new( x , y)
            if !contains(a)                           # nie wrzucaj powtarzajacych sie siedzen
              @seats.push(a)
            end
            
          else
            
            for j in 0..@entrances.length-1           #sprawdz czy siedzenie nie stoi w drzwiach
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

      def contains(a)                                  # sprawdzanie powtarzajacych sie siedzen
        for i in 0..@seats.length-1
          if @seats[i].equals(a)
            return true
          end
        end
        false
      end


    end

  end
end



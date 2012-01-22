
cena=100000
bus_mama = Bus.new(cena , nil , nil , nil)
bus_papa = Bus.new(cena, nil , nil , nil)
bus = bus_mama.reproduce(bus_papa)
bus2 = bus_papa.reproduce(bus_mama)

#wyswitlanie ASCII busaa
k=0
l=0

entr = []
for i in 0..bus_mama.entrances_length-1
  entr.push(bus_mama.entrances(i).x/10)
  entr.push((bus_mama.entrances(i).x+10)/10)
end
#wyswietlanie wspolrzednych siedzen
#for i in 0..bus.seats_length-1
#  puts
#  puts bus.seats(i).x
#  puts bus.seats(i).y
#end
puts "MAMA Bus"
#sophisticated bus presentation algorithm
for i in 0..4
  str='-' * (bus_mama.length/10*2)
  puts str
  str=''
  for j in 0..bus_mama.length/10*2
    if j%2 ==0
        str = str + "|"

    elsif i == 4
      if j/2 == entr[k] 
        str = str + 'D'
        k = k+1
      elsif l < bus_mama.seats_length && j/2 == (bus_mama.seats(l).x/10)
        str = str + "S"
          l = l+1        
      else
        str = str + ' '
      end

    elsif l < bus_mama.seats_length && i == (bus_mama.seats(l).y/7)
      if l < bus_mama.seats_length && j/2 == (bus_mama.seats(l).x/10)
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
str='-' * (bus_mama.length/10*2)
  puts str
k=0
l=0
puts "PAPA BUS"
for i in 0..4
  str='-' * (bus_papa.length/10*2)
  puts str
  str=''
  for j in 0..bus_papa.length/10*2
    if j%2 ==0
        str = str + "|"

    elsif i == 4
      if j/2 == entr[k] 
        str = str + 'D'
        k = k+1
      elsif l < bus_papa.seats_length && j/2 == (bus_papa.seats(l).x/10)
        str = str + "S"
          l = l+1        
      else
        str = str + ' '
      end

    elsif l < bus_papa.seats_length && i == (bus_papa.seats(l).y/7)
      if  l < bus_papa.seats_length && j/2 == (bus_papa.seats(l).x/10)
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
str='-' * (bus_papa.length/10*2)
  puts str
k=0
l=0
puts "BABY1 BUS"
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

    elsif l < bus.seats_length && i == (bus.seats(l).y/7)
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
k=0
l=0
puts "BABY2 BUs"

for i in 0..4
  str='-' * (bus2.length/10*2)
  puts str
  str=''
  for j in 0..bus2.length/10*2
    if j%2 ==0
        str = str + "|"

    elsif i == 4
      if j/2 == entr[k] 
        str = str + 'D'
        k = k+1
      elsif l < bus2.seats_length && j/2 == (bus2.seats(l).x/10)
        str = str + "S"
          l = l+1        
      else
        str = str + ' '
      end

    elsif l< bus2.seats_length && i == (bus2.seats(l).y/7)
      if l < bus2.seats_length && j/2 == (bus2.seats(l).x/10)
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
str='-' * (bus2.length/10*2)
  puts str


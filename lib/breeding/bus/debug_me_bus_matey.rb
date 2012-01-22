

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
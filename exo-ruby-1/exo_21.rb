puts "Choisis un nombre entre 1 et 25 ?"
print "> "
floors = gets.chomp.to_i
puts "Voici la pyramide :"
brick = 1
  spaces = floors-1
floors.times do
  print 32.chr * spaces  # 32 is the space character
  puts 35.chr * brick  # 35 is the '#' character
  brick = brick + 1
  spaces = spaces - 1
end

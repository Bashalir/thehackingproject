puts "Choisis un nombre entre 1 et 25 ?"
print "> "
floors = gets.chomp.to_i
puts "Voici la pyramide :"

floors.downto(1) { |n| puts "#" * n }

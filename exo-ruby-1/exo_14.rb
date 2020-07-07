puts "Choisis un nombre ?"
print "> "
count_number = gets.chomp.to_i

count_number.downto(1) { |n| puts "#{n}" }

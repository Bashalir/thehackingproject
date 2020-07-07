puts "Choisis un nombre ?"
print "> "
count_number = gets.chomp.to_i

for n in 1..count_number
  puts "#{n}"
end

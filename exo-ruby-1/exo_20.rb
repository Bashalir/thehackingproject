puts "Choisis un nombre entre 1 et 25 ?"
print "> "
floors = gets.chomp.to_i
puts "Voici la pyramide :"

for n in 1..floors
  puts "#" * n
end

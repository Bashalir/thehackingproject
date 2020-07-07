puts "Choisis un nombre entre 1 et 25 ?"
print "> "
floors = gets.chomp.to_i
puts "Voici la pyramide :"

n = 1
while n <= floors
  puts "#" * n
  n = n + 1
end

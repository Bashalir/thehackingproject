puts "Choisis un nombre entre 1 et 25 ?"
print "> "
floors = gets.chomp.to_i
puts "Voici la pyramide :"

n = floors
while n >= 0
  puts "#" * n
  n = n - 1
end

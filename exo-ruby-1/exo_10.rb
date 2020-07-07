puts "Quel est ton année de naissance ?"
print "> "
user_year_of_birth = gets.chomp.to_i

if user_year_of_birth == 2017
  puts "Tu es né en 2017"
elsif user_year_of_birth > 2017
  puts "Tu étais pas encore né en 2017"
else
  puts "Tu avais, #{2017 - user_year_of_birth} ans !"
end

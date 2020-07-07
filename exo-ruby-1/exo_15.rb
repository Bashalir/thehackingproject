puts "Quel est ton année de naissance ?"
print "> "
user_year_of_birth = gets.chomp.to_i
current_year = Time.now.year

for n in user_year_of_birth..current_year
  user_age = n - user_year_of_birth
  description_age = ""

  case user_age
  when 0
    description_age = "tu es né(e)"
  when 1
    description_age = "tu avais 1 an"
  when current_year - user_year_of_birth
    description_age = "tu as #{user_age} ans"
  else
    description_age = "tu avais #{n - user_year_of_birth} ans"
  end

  puts "En #{n} #{description_age}"
end

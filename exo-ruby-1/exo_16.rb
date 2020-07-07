puts "Quel est ton année de naissance ?"
print "> "
user_year_of_birth = gets.chomp.to_i
current_year = Time.now.year

for n in user_year_of_birth..current_year
  user_age = n - user_year_of_birth
  year_count = current_year - n
  description_age = ""
  description_year = ""

  case user_age
  when 0
    description_age = "tu etais né(e)"
  when 1
    description_age = "tu avais 1 an"
  when current_year - user_year_of_birth
    description_age = "tu as #{user_age} ans"
  else
    description_age = "tu avais #{n - user_year_of_birth} ans"
  end

  case year_count
  when 1
    description_year = "Il y'as 1 an"
  when 0
    description_year = "Aujourd'hui"
  else
    description_year = "Il y'as #{year_count} ans"
  end

  puts "#{description_year} #{description_age}"
end

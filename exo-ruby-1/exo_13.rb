puts "Quel est ton année de naissance ?"
print "> "
user_year_of_birth = gets.chomp.to_i
current_year = Time.now.year 

for n in user_year_of_birth..current_year
    puts "#{n}"
  end

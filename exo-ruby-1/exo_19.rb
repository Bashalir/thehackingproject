mail_list = []

for n in 1..50
  if n < 10
    n = "0#{n}"
  end
  mail_list << "jean.dupont.#{n}@mail.fr"
end

mail_list.each_with_index { |val, index|
  if ((index + 1).even?)
    puts val
  end
}

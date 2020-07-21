# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts `clear`

puts '------------------------------------------------'
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts '-------------------------------------------------'

puts 'Quel est ton prénom stp ?'
print '> '
user_name = gets.chomp
sleep(0.5)
puts `clear`
round = 1
user = HumanPlayer.new(user_name)
enemies = [Player.new('Josiane'), Player.new('José')]

while user.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)

  choice = ''

  loop do
    puts '=============='
    puts "Round #{round}"
    puts '=============='
    puts "\n"
    user.show_state
    puts '_____________________________________________'
    puts "\n"

    puts 'Quelle action veux-tu effectuer ?'
    puts "\n"
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner '
    puts "\n"
    puts 'attaquer un joueur en vue :'
    enemies.each_with_index do |enemy, index|
      next if enemy.life_points <= 0
      puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie"
    end
    puts "\n"
    choice = gets.chomp

    break if choice.length == 1 && choice =~ /^[as01]/
    puts '*******# ERREUR MAUVAISE SAISIE #******* '
    sleep(1)
    puts `clear`
  end
  puts `clear`

  case choice
  when 'a'
    puts "\n\n"
    puts '------------------------------------------'
    puts "#{user.name} cherche une arme !"
    puts '------------------------------------------'
    puts "\n"
    user.search_weapon
  when 's'
    puts "\n\n"
    puts '-----------------------------------------'
    puts "#{user.name} cherche à ce soigner !"
    puts '-----------------------------------------'
    puts "\n"
    user.search_health_pack
  when '0'
    puts "\n\n"
    puts '-----------------------------------------'
    puts "#{user.name} attaque #{enemies[0].name}"
    puts '-----------------------------------------'
    puts "\n"
    user.attacks(enemies[0])
  when '1'
    puts "\n\n"
    puts '-----------------------------------------'
    puts "#{user.name} attaque #{enemies[1].name}"
    puts '-----------------------------------------'
    puts "\n"
    user.attacks(enemies[1])
  end
  puts "\n\n"
  user.show_state
  sleep(1)

  next unless enemies.any? { |enemy| enemy.life_points > 0 }

  puts "\n\n"
  puts '********************************'
  puts "Les autres joueurs t'attaquent !"
  puts '********************************'
  puts "\n"

  enemies.each do |enemy|
    next if enemy.life_points <= 0

    puts "#{enemy.name} t'attaque"
    puts '-----------------------------------------'
    puts "\n"
    enemy.attacks(user)
    puts "\n"
    sleep(1)
  end

  loop do
    puts "\n"
    puts 'Appuyer sur la touche "c" pour continuer'
    choice = gets.chomp
    break if choice == 'c'
  end

  round += 1
  puts `clear`
end
puts "\n"
puts "\n"
puts '*******************'
puts 'La partie est finie'
puts '*******************'

puts "\n"

if user.life_points > 0
  puts 'BRAVO ! TU AS GAGNE !'
else
  puts 'Loser ! Tu as perdu !'
end

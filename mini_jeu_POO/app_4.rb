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
game = Game.new(user_name)
puts `clear`
round = 1

while game.is_still_ongoing?

  game.new_players_in_sight

  choice = false

  while choice == false
    choice = game.menu(round)
    sleep(1)
    puts `clear`
  end

  game.menu_choice(choice)

  break if game.enemies.empty?

  game.enemies_attack

  loop do
    puts "\n"
    puts 'Appuyer sur la touche "c" pour continuer'
    choice = gets.chomp
    break if choice == 'c'
  end

  round += 1
  puts `clear`
end

game.end(round)

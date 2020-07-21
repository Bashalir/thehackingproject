# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '------------------------------------------------'
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts '-------------------------------------------------'

puts 'Quel est ton prénom stp ?'
print '> '
user_name = gets.chomp

user = HumanPlayer.new(user_name)
enemies = [Player.new('Josiane'), Player.new('José')]

while user.life_points > 0 || (player1.life_points > 0 && player2.life_points > 0)

  loop do
    user.show_state
    puts 'Quelle action veux-tu effectuer ?'
    puts "\n"
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner '
    puts "\n"
    puts 'attaquer un joueur en vue :'
    enemies.each_with_index do |enemy, index|
      puts "#{index} - #{enemy.show_state}"
    end

    choice = gets.chomp

    break if choice.length = 1 && choice =~ /^[as01]/
    puts '******* ERREUR ******* '
    sleep(1)
    puts `clear`
  end
end

puts 'La partie est finie'
if user.life_points > 0
  puts 'BRAVO ! TU AS GAGNE !'
else
  puts 'Loser ! Tu as perdu !'
end

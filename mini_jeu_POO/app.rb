# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')
round = 1

while player1.life_points > 0 && player2.life_points > 0

  puts "\nVoici l'état de chaque joueur :\n\n"
  player1.show_state
  player2.show_state

  puts "\nPassons à la phase d'attaque :\n\n"

  puts "Round #{round}"
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)

  round += 1
end

binding.pry

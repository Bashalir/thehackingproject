# frozen_string_literal: true

class Game
  attr_accessor :human_player, :enemies, :player_left, :enemies_in_sight

  def initialize(name)
    @player_left = 10
    @enemies_in_sight = []
    @human_player = HumanPlayer.new(name)
    @enemies = []
    
    (1..4).each do |index|
      player = Player.new("player#{index}")
      @enemies << player
      @enemies_in_sight << player
    end
  end

  def roll_the_dice
    rand(1..6)
  end

  def kill_player(player_name)
    @enemies.each_with_index do |ennemy, index|
      @enemies.delete_at(index) if ennemy.name == player_name
    end
  end

  def is_still_ongoing?
    if !@enemies.empty? && @human_player.life_points > 0
      true
    else
      false
    end
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies.length} ennemis"
  end

  def menu(round)
    puts '=============='
    puts "Round #{round}"
    puts '=============='
    puts "\n"
    @human_player.show_state
    puts '_____________________________________________'
    puts "\n"

    puts 'Quelle action veux-tu effectuer ?'
    puts "\n"
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner '
    puts "\n"
    puts 'attaquer un joueur en vue :'
    @enemies.each_with_index do |enemy, index|
      next if enemy.life_points <= 0
      puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie"
    end
    puts "\n"
    choice = gets.chomp
    limited_choice = /^[as0-#{@enemies.length - 1}]/

    return choice if choice.length == 1 && choice =~ limited_choice
    puts '*******# ERREUR MAUVAISE SAISIE #******* '
    false
  end

  def menu_choice(choice)
    case choice
    when 'a'
      puts "\n\n"
      puts '------------------------------------------'
      puts "#{@human_player.name} cherche une arme !"
      puts '------------------------------------------'
      puts "\n"
      @human_player.search_weapon
    when 's'
      puts "\n\n"
      puts '-----------------------------------------'
      puts "#{@human_player.name} cherche à ce soigner !"
      puts '-----------------------------------------'
      puts "\n"
      @human_player.search_health_pack
    else
      index = choice.to_i
      puts "\n\n"
      puts '-----------------------------------------'
      puts "#{@human_player.name} attaque #{@enemies[index].name}"
      puts '-----------------------------------------'
      puts "\n"
      @human_player.attacks(@enemies[index])
      kill_player(@enemies[index].name) if @enemies[index].life_points == 0
    end
  end

  def enemies_attack
    puts "\n\n"
    puts '********************************'
    puts "Les autres joueurs t'attaquent !"
    puts '********************************'
    puts "\n"

    @enemies.each do |enemy|
      break if @human_player.life_points <= 0
      next if enemy.life_points <= 0
      puts "#{enemy.name} t'attaque"
      puts '-----------------------------------------'
      puts "\n"
      enemy.attacks(@human_player)
      puts "\n"
      sleep(1)
    end
  end

  def end(round)
    puts "\n"
    puts "\n"
    puts '*******************'
    puts 'La partie est finie'
    puts '*******************'

    puts "\n"

    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE ! EN #{round} ROUND !"
    else
      puts "Loser ! Tu as perdu ! en #{round} round."
    end
  end

  def new_players_in_sight
    if @player_left == @enemies_in_sight.length
      return puts 'Tous les joueurs sont déjà en vue'
    end

    luck = roll_the_dice

    case luck
    when 1
      puts "Aucun ennemi ne s'approche"

    when 2..4
      puts 'Un nouvel adversaire arrive en vue'
      @enemies_in_sight << Player.new("player_#{rand(1999..9999)}")
      @player_left -= 1

    else
      puts 'Deux nouveaux adversaires arrivent en vue'
      @enemies_in_sight << Player.new("player_#{rand(1999..9999)}")
      @enemies_in_sight << Player.new("player_#{rand(1999..9999)}")
      @player_left -= 2
    end
  end
end

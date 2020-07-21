# frozen_string_literal: true

require 'game'
require 'player'

describe 'Game' do
  before do
    @game = Game.new('Wolverine')
  end

  it 'Create a player with name is "Wolverine" and 4 ennemies' do
    expect(@game.human_player.name).to eq('Wolverine')
    expect(@game.enemies.length).to eq(4)
  end

  it 'Kill the first player named "player1"' do
    @game.kill_player('player1')
    expect(@game.enemies.length).to eq(3)
    expect(@game.enemies[0].name).to eq('player2')
  end

  it 'check that there are still players' do
    expect(@game.is_still_ongoing?).to eq(true)
    @game.kill_player('player1')
    @game.kill_player('player2')
    @game.kill_player('player3')
    @game.kill_player('player4')
    @game.human_player.life_points = 0
    expect(@game.is_still_ongoing?).to eq(false)
  end

  it 'show human player statut and the number of enemies' do
    expect { @game.show_players }.to output("Wolverine a 100 points de vie et une arme de niveau 1\nIl reste 4 ennemis\n").to_stdout
  end

  it 'Don\'t Add enemies if all enemies are in sight' do
    @game.enemies_in_sight = [Player.new('player10')]
    @game.player_left = 1
    expect { @game.new_players_in_sight }.to output("Tous les joueurs sont déjà en vue\n").to_stdout
  end

  it 'Don\'t Add enemies if all enemies are in sight and luck is 1' do
    @game.enemies_in_sight = []
    allow(@game).to receive(:roll_the_dice) { 1 }
    expect(@game.enemies_in_sight.length).to eq(0)
    expect { @game.new_players_in_sight }.to output("Aucun ennemi ne s'approche\n").to_stdout
  end
  # it 'Add enemies if all enemies are not in sight' do
  #   expect { @game.show_players }.to output("Wolverine a 100 points de vie et une arme de niveau 1\nIl reste 4 ennemis\n").to_stdout
  # end
  it 'Add one enemies if not all enemies are in sight and luck is 3' do
    @game.enemies_in_sight = []
    allow(@game).to receive(:roll_the_dice) { 3 }
    expect { @game.new_players_in_sight }.to output("Un nouvel adversaire arrive en vue\n").to_stdout
    expect(@game.enemies_in_sight.length).to eq(1)
  end

  it 'Add two enemies if not all enemies are in sight and luck is 6' do
    @game.enemies_in_sight = []
    allow(@game).to receive(:roll_the_dice) { 6 }
    expect { @game.new_players_in_sight }.to output("Deux nouveaux adversaires arrivent en vue\n").to_stdout
    expect(@game.enemies_in_sight.length).to eq(2)
  end
end

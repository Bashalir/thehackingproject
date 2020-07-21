# frozen_string_literal: true

require 'game'

describe 'Game' do
  before do
    @game = Game.new('Wolverine')
  end

  it 'Create a player with name is "Wolverine" and 4 ennemies' do
    expect(@game.human_player.name).to eq('Wolverine')
    expect(@game.ennemies.length).to eq(4)
  end

  it 'Kill the first player named "player1"' do
    @game.kill_player('player1')
    expect(@game.ennemies.length).to eq(3)
    expect(@game.ennemies[0].name).to eq('player2')
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

  it 'show human player statut and the number of ennemies' do
    expect { @game.show_players }.to output("Wolverine a 100 points de vie et une arme de niveau 1\nIl reste 4 ennemis").to_stdout
  end
end

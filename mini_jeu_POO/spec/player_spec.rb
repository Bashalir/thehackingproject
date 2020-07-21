# frozen_string_literal: true

require 'player'

describe 'Player' do
  before do
    @player1 = Player.new('José')
    @player2 = Player.new('Mourinho')
  end

  it 'Create a player with name is "José" and have 10 life points' do
    expect(@player1.name).to eq('José')
    expect(@player1.life_points).to eq(10)
  end

  it 'Display player status' do
    expect { @player1.show_state }.to output("José a 10 points de vie\n").to_stdout
    expect { @player2.show_state }.to output("Mourinho a 10 points de vie\n").to_stdout
  end

  it 'Remove 5 life points from the player' do
    @player1.gets_damage(5)
    expect(@player1.life_points).to eq(5)
  end

  it 'The player "José" is dead' do
    expect { @player1.gets_damage(11) }.to output("le joueur José a été tué !\n").to_stdout
    expect { @player1.show_state }.to output("José a 0 points de vie\n").to_stdout
  end

  it 'the player "José attack the player "Mourinho"' do
    allow(@player1).to receive(:compute_damage) { 5 }
    expect { @player1.attacks(@player2) }.to output("José attaque Mourinho\nil lui inflige 5 points de dommages\n").to_stdout
    expect { @player2.show_state }.to output("Mourinho a 5 points de vie\n").to_stdout
    expect { @player1.show_state }.to output("José a 10 points de vie\n").to_stdout
  end
end

describe 'HumanPlayer' do
  before do
    @humanPlayer = HumanPlayer.new('José')
  end

  it 'Create a human player with name is "José" and have 100 life points' do
    expect(@humanPlayer.name).to eq('José')
    expect(@humanPlayer.life_points).to eq(100)
  end

  it 'Display human player status with the weapon level' do
    expect { @humanPlayer.show_state }.to output("José a 100 points de vie et une arme de niveau 1\n").to_stdout
  end

  it 'The human player search a weapon' do
    allow(@humanPlayer).to receive(:roll_the_dice) { 2 }
    expect { @humanPlayer.search_weapon }.to output("Tu as trouvé une arme de niveau 2\nYouhou ! elle est meilleure que ton arme actuelle : tu la prends.\n").to_stdout
    allow(@humanPlayer).to receive(:roll_the_dice) { 1 }
    expect { @humanPlayer.search_weapon }.to output("Tu as trouvé une arme de niveau 1\nM****... elle n\'est pas mieux que ton arme actuelle...\n").to_stdout
  end

  it 'The human player search a health pack' do
    @humanPlayer.life_points = 10
    allow(@humanPlayer).to receive(:roll_the_dice) { 1 }
    expect { @humanPlayer.search_health_pack }.to output("Tu n'as rien trouvé...\n").to_stdout
    expect(@humanPlayer.life_points).to eq(10)

    allow(@humanPlayer).to receive(:roll_the_dice) { 3 }
    expect { @humanPlayer.search_health_pack }.to output("Bravo, tu as trouvé un pack de +50 points de vie !\n").to_stdout
    expect(@humanPlayer.life_points).to eq(60)

    allow(@humanPlayer).to receive(:roll_the_dice) { 6 }
    expect { @humanPlayer.search_health_pack }.to output("Waow, tu as trouvé un pack de +80 points de vie !\n").to_stdout
    expect(@humanPlayer.life_points).to eq(100)
  end
end

# frozen_string_literal: true

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def compute_damage
    rand(1..6)
  end

  def gets_damage(damage_points)
    @life_points -= damage_points

    if @life_points <= 0
      @life_points = 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(targeted_player)
    puts "#{@name} attaque #{targeted_player.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages"
    targeted_player.gets_damage(damage)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    roll_the_dice * @weapon_level
  end

  def roll_the_dice
    rand(1..6)
  end

  def search_weapon
    level = roll_the_dice
    puts "Tu as trouvé une arme de niveau #{level}"
    if level > @weapon_level
      puts 'Youhou ! elle est meilleure que ton arme actuelle : tu la prends.'
    else
      puts 'M****... elle n\'est pas mieux que ton arme actuelle...'
    end
  end

  def increase_health(points)
    @life_points += points
    @life_points = 100 if @life_points > 100
  end

  def search_health_pack
    luck = roll_the_dice

    case luck
    when 1
      puts "Tu n'as rien trouvé..."
    when 2..5
      increase_health(50)
      puts 'Bravo, tu as trouvé un pack de +50 points de vie !'
    when 6
      increase_health(80)
      puts 'Waow, tu as trouvé un pack de +80 points de vie !'
    end
  end
end

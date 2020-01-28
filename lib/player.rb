require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name.to_s
    @life_points = 10.to_i
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damages_points)
    damages_points = damages_points.to_i
    @life_points -= damages_points
    puts "et lui inflige #{damages_points} points de dommages"
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"      
    end
  end

  def attacks(player_attacked)
    puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"
    damage_received = compute_damage()
    player_attacked.gets_damage(damage_received)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :name, :life_points, :weapon_level
  
  def initialize(name)
    @name = name.to_s
    @life_points = 100.to_i
    @weapon_level = 1
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    puts "Examen de l'arme en cours ..."
    die_roll = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{die_roll}"
    if @weapon_level < die_roll
      puts "Félicitations ! Prends cette arme pour infliger plus de dégâts !"
      @weapon_level = die_roll
      puts "Arme de niveau #{die_roll} équipée !"
    else @weapon_level > die_roll
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    puts show_state
    puts "Examen du coffre en cours ..."
    die_roll = rand(1..6)
    case die_roll
    when 1
      puts "Tu n'as rien trouvé..." 
    when 2..5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points <= 50
        @life_points += 50
        puts show_state
      else @life_points > 50
        @life_points = 100
        puts show_state
      end
    else 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points <= 20
        @life_points += 80
        puts show_state
      else @life_points > 20
        @life_points = 100
        puts show_state
      end
    end
  end
end

=begin
    
    

=end
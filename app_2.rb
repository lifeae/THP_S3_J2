require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "  ☆ ‥…━━━━━━━━━━━━━━━━━━━━☆  ☆ ━━━━━━━━━━━━━━━━━━━━…‥☆"
puts "  ||    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    ||"
puts "  || Le but du jeu est d'être le dernier survivant ! ||"
puts "  ☆ ‥…━━━━━━━━━━━━━━━━━━━━☆  ☆ ━━━━━━━━━━━━━━━━━━━━…‥☆"
puts
puts "Comment t'appelles-tu ?"
user = HumanPlayer.new(gets.chomp.to_s)
puts "Enchanté #{user.name} ! Bienvenue dans l'arène !"
gets.chomp
enemies = []
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "attaquer un joueur en vue :"
  puts "0 - Josiane a #{player1.life_points} points de vie"
  puts "1 - José a #{player2.life_points} points de vie"
  user_choice = gets.chomp.to_s
  case user_choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  else
    puts "Erreur de saisie, pour la peine tu passes ton tour !"
  end
  gets.chomp
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemie|
    if enemie.life_points > 0
      enemie.attacks(user)
    end
  end
end
puts "La partie est finie"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
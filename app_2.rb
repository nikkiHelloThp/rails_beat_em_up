require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'
class App2
	def perform
		puts " ------------------------------------------------\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
		puts "Quel est ton nom?"
		input = gets.chomp
		human_player = HumanPlayer.new(input)
		
		player_1 = Player.new
		player_2 = Player.new("carapuce")
		
		enemies = [player_1, player_2]

		while human_player.life_points > 0 && (player_1.life_points > 0 || player_2.life_points > 0)
			puts "Voici ton etat:"
	    human_player.show_state
	    puts "\n"
	    puts "Quelle action veux-tu effectuer ?\n\na - chercher une meilleure arme\ns - chercher à se soigner\n\nattaquer un joueur en vue :\n0 - #{player_1.name} a #{player_1.life_points} points de vie\n1 - #{player_2.name} a #{player_2.life_points} points de vie"
			puts "> "
			answer = gets.chomp
# ne sort pas de la boucle 'case', les ennemies ne peuvent attaquer
			case 
			when answer == "a"
				human_player.search_weapon
			when answer == "s"
				human_player.search_health_pack
			when answer == "0"
				human_player.attacks(player_1)
			when answer == "1"
				human_player.attacks(player_2)
			else
				puts "enter a valid key"
			end
			puts "\n"
			puts "Les autres joueurs t'attaquent !"
			enemies.each { |enemy| enemy.attacks(human_player) if enemy.life_points > 0 }
			puts"\n"
		end
	  
	  puts "La partie est finie"
		puts human_player.life_points > 0 ? "BRAVO ! TU AS GAGNE !" : "Loser ! Tu as perdu !"
	end
end
App2.new.perform
binding.pry
puts "End of file"
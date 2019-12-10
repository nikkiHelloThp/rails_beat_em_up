require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

class App
	def perform
		player_1 = Player.new
		player_2 = Player.new("carapuce")
		
		puts "A ma droite \'#{player_1.name}\'"
		puts "A ma droite \'#{player_2.name}\'\n\n"

		while player_1.life_points > 0 && player_2.life_points > 0
			puts "Voici l'etat de chaque joueurs:"
	    player_1.show_state
	    player_2.show_state
	    puts "\n"
	    puts "Passons a la phase d'attaque:"
	    player_2.attacks(player_1)
	    player_1.life_points > 0 ? player_1.attacks(player_2) : break
	    puts "\n"
		end
	end
end

App.new.perform
binding.pry
puts "End of file"
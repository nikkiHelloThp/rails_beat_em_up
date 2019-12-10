require 'bundler'
Bundler.require

require_relative 'lib/game_2'
require_relative 'lib/player'
require_relative 'lib/human_player'

class App4
	def perform
		puts " ------------------------------------------------\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
		puts "Quel est ton nom?"
		input = gets.chomp
		my_game = Game2.new(input)
		while my_game.is_still_ongoing?
			my_game.show_players
			my_game.new_players_in_sight
			my_game.menu
			my_game.enemies_attack
		end
	end
end
App4.new.perform
binding.pry
puts "End of file"
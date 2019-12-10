require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

class App3
	def perform
		puts " ------------------------------------------------\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
		puts "Quel est ton nom?"
		input = gets.chomp
		my_game = Game.new(input)
		while my_game.is_still_ongoing?
			my_game.show_players
			my_game.menu
			my_game.enemies_attack
		end
	end
end
App3.new.perform
binding.pry
puts "End of file"
require_relative 'player'
require_relative 'human_player'

class Game
	attr_accessor :human_player, :enemies

	def initialize(human_player, enemies=[])
		human_player = HumanPlayer.new(human_player)
		@human_player = human_player
		enemies_names = ["pikachu", "salameche", "carapuce", "bulbizarre"]

		i = 0
		4.times do
			enemy = Player.new(enemies_names[i])
			enemies << enemy
			i += 1
		end

		@enemies = enemies
	end

	def kill_player(enemies)
		puts @enemies = enemies.map.reject { |enemy| enemy.life_points <= 0 }
	end

	def is_still_ongoing?
		@human_player.life_points > 0 && @enemies.size > 0 ? true : end_game#false
	end

	def show_players
		puts "#{@human_player.name} a #{@human_player.life_points} points de vie"
		puts "il reste #{@enemies.size} ennemies"
	end

	def menu
		i = 0
		puts "a- chercher une nouvelle arme"
		puts "s- chercher un kit de soin"
		@enemies.size.times do
			puts "#{i}- attaquer #{@enemies[i].name}" if @enemies[i].life_points > 0
			i += 1
		end
		puts "> "
		menu_choice(gets.chomp)
	end

	def menu_choice(answer)
		if answer == "a"
			@human_player.search_weapon
		elsif answer == "s"
			@human_player.search_health_pack
		elsif (/\d/.match(answer) && @enemies.size > 0)  && (0..@enemies.size-1).include?(answer.to_i)
			@human_player.attacks(@enemies[answer.to_i])
		else
			puts "enter a valid key"
		end
		kill_player(enemies)
	end

	def enemies_attack
		@enemies.map { |enemy| enemy.attacks(@human_player) if enemy.life_points > 0 }
	end

	def end_game
	  puts "La partie est finie"
		puts @human_player.life_points > 0 ? "BRAVO ! TU AS GAGNE !" : "Loser ! Tu as perdu !"
	end

end
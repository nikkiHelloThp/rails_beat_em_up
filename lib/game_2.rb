require_relative 'player'
require_relative 'human_player'

class Game2
	attr_accessor :human_player, :enemies_in_sight, :players_left

	def initialize(human_player, enemies_in_sight=[], players_left=10)
		human_player = HumanPlayer.new(human_player)
		@human_player = human_player

		@enemies_in_sight = enemies_in_sight
		@players_left = players_left

		4.times do
			new_player
		end

	end

	def new_player
		enemy = Player.new("joueur#{rand(1..9999)}")
		@enemies_in_sight << enemy
	end

	def kill_player(enemies)
		@enemies_in_sight = enemies.map.reject { |enemy| enemy.life_points <= 0 }
	end

	def is_still_ongoing?
		@human_player.life_points > 0 && @players_left > 0 ? true : end_game#false
	end

	def show_players
		puts "#{@human_player.name.upcase} a #{@human_player.life_points} points de vie"
		puts "il reste #{@enemies_in_sight.size} ennemies"
	end

	def menu
		i = 0
		puts "a- chercher une nouvelle arme"
		puts "s- chercher un kit de soin"
		@enemies_in_sight.size.times do
			puts "#{i}- attaquer #{@enemies_in_sight[i].name}" if @enemies_in_sight[i].life_points > 0
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
		elsif (/\d/.match(answer) && @enemies_in_sight.size > 0) && (0..@enemies_in_sight.size-1).include?(answer.to_i)
			@human_player.attacks(@enemies_in_sight[answer.to_i])
		else
			puts "enter a valid key"
		end
		kill_player(enemies_in_sight)
	end

	def enemies_attack
		@enemies_in_sight.map { |enemy| enemy.attacks(@human_player) if enemy.life_points > 0 }
	end

	def end_game
	  puts "La partie est finie"
		puts @human_player.life_points > 0 ? "BRAVO ! TU AS GAGNE !" : "Loser ! Tu as perdu !"
	end

	def new_players_in_sight
		puts "New enemies in approach ?"
		if @enemies_in_sight.size == @players_left
			puts "Tous les joueurs sont déjà en vue"
		else
			new_enemies_possible = rand(1..6)
			case 
			when new_enemies_possible == 1
				puts "aucun adversaire supplementaire"
			when (2..4).include?(new_enemies_possible)
				puts "un adversaire arrive!"
				new_player
			when (5..6).include?(new_enemies_possible)
				puts "deux adversaires arrivent!!!"
				2.times do
					new_player
				end
			end
		end
	end

end
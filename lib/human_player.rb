require_relative 'player'

class HumanPlayer < Player
	attr_accessor :weapon_level
	
	def initialize(name, life_points=100, weapon_level=1)
		@weapon_level = weapon_level

		super(name, life_points)
	end

	def show_state
		"#{super} et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		super * @weapon_level
	end

	def search_weapon
		weapon_found = rand(1..6)
		p "Tu as trouvé une arme de niveau #{weapon_found}"

		if weapon_found > @weapon_level
			p "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
			@weapon_level = weapon_found
		else
			p "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end

	def search_health_pack
		health_pack_found = rand(1..6)
		
		if health_pack_found == 1
			p "Tu n'as rien trouvé... "
		elsif health_pack_found == 6
			p "Waow, tu as trouvé un pack de +80 points de vie !"
			p @life_points == 100 ? "... mais tu es au max de ta life!" : (@life_points <= 20 ? @life_points += 80 : (@life_points += 100 - @life_points))
		else
			p "Bravo, tu as trouvé un pack de +50 points de vie !"
			p @life_points == 100 ? "... mais tu es au max de ta life!" : (@life_points <= 50 ? @life_points += 50 : (@life_points += 100 - @life_points))
		end
	end
end
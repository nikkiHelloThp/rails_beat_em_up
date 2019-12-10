class Player
	attr_accessor :name, :life_points

	def initialize(name="pikachu", life_points=10)
		@name = name
		@life_points = life_points
	end

	def show_state
		p "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(damage_received=5)
		@life_points -= damage_received
		if @life_points <= 0
			p "le joueur #{@name} a été tué !"
		end
	end

	def attacks(targeted_player)
		p "le joueur #{@name} attaque le joueur #{targeted_player.name}"
		damage = compute_damage
		p "il lui inflige #{damage} points de dommages"
		targeted_player.gets_damage(damage)
	end

	def compute_damage
		return rand(1..6)
	end
end
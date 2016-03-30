module RestsHelper
	def already_starred?(rest, current_user)
		if rest.stars.exists? && current_user.stars.exists?
			true
		else
			false 
		end
	end
end

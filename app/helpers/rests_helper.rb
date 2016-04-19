module RestsHelper

	def already_starred?(rest, current_user)
		if star = rest.stars.find_by(user_id: current_user.id)
		  star.starred
    else
    false 
    end
	end


end
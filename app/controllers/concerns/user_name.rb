module UserName
	# manages a non-logged-in user name
	extend ActiveSupport::Concern

	def user_name
		current_user ? current_user.first_name : guest_user.first_name
	end

	def guest_user 
		guest = GuestUser.new(name: "Guest User",
													first_name: "Guest",
													last_name: "User",
													email: "guest@user.com")
		guest
	end

end
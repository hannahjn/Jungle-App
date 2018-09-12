class UsersController < ApplicationController
	#action for rendering the signup form
  def new
  end
	#receives the signup form and creates a user
	def create
		user = User.new(user_params)
		if user.save
			session[:name] = user.name
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end

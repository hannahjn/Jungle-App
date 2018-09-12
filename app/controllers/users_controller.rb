class UsersController < ApplicationController
	#action for rendering the signup form
  def new
  end
	#receives the signup form and creates a user
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.user_idredirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	private

	def user_paramsparams.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end```

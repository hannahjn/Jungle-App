class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true 
	validates :email, presence: true 
	validates :email, uniqueness: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	validates_length_of :password, minimum: 1

	def authenticate_with_credentials(email, password) 
		# remove whitespace from password and make email lowercase incase of mistypes.
		password = password.strip
		email = email.downcase
		
		# find user in database
		user = User.find_by_email(email)
		if user && user.authenticate(password)
			user
		else 
			nil
		end
	end

end

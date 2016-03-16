class Owner < ActiveRecord::Base
	has_many :rests, through: :rest_owners
	has_many :rest_owners
	validates :first_name, presence: true
	validates :last_name, presence: { message: "must exit" }
	validates :email, presence: true, uniqueness: true, 
		format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "is not a valid email"}
end

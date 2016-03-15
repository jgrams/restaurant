class Owner < ActiveRecord::Base
	has_many :rests, through: :rest_owners
	has_many :rest_owners
end

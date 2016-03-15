class Rest < ActiveRecord::Base
	has_many :owners, through: :rest_owners
	has_many :rest_owners
end

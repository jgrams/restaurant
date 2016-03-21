class Rest < ActiveRecord::Base
	has_many :rest_owners
	has_many :owners, through: :rest_owners
  has_many :reservations
end

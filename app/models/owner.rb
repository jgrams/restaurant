  class Owner < User
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :rest_owners
    has_many :rests, through: :rest_owners
 end
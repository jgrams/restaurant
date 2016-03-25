class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reservations
	before_save { self.email = email.downcase }
	validates :email, presence: true, 
		length: { maximum: 255 }, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
		uniqueness: { case_sensitive: false }
  accepts_nested_attributes_for :reservations
  
end

class Reservation < ActiveRecord::Base
  belongs_to :rest
  belongs_to :user
  validates :time, presence: true
  validates :rest_id, presence: true
  validates :user_id, presence: true
end

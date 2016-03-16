class RestOwner < ActiveRecord::Base
	belongs_to :owner
	belongs_to :rest
end

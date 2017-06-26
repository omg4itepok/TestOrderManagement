class Order < ApplicationRecord
	validates :difficulty, numericality: { greater_than: 0 }
	validates :pic, presence: true
	belongs_to :worker
	validates_associated :worker
	belongs_to :shift
	validates_associated :shift
end

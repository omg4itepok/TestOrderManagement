class Shift < ApplicationRecord
	belongs_to :factory
	validates :date, uniqueness: true
	validates_associated :factory
	has_many :workers
	has_many :orders
end

class Worker < ApplicationRecord
	validates :name, presence: true
	validates :workingHrs, numericality: { greater_than: 0 }
	belongs_to :shift
	validates_associated :shift
	belongs_to :factory
	validates_associated :factory
	has_many :orders
end

class Factory < ApplicationRecord
	validates :name, presence: true
	belongs_to :user
	validates_associated :user
	has_many :workers
	has_many :shifts
end
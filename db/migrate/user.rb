class User < ApplicationRecord
	validates :name, presence: true
	has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
	belongs_to :manager, class_name: "Employee"
	has_many :factories
end

class Factory < ApplicationRecord
	validates :name, presence: true
	belongs_to :user
	validates_associated :user
	has_many :workers
	has_many :shifts
end

class Order < ApplicationRecord
	validates :difficulty, numericality: { greater_than: 0 }
	validates :pic, presence: true
	belongs_to :worker
	validates_associated :worker
	belongs_to :shift
	validates_associated :shift
end

class Worker < ApplicationRecord
	validates :name, presence: true
	validates :workingHrs, numericality: { greater_than: 0 }
	belongs_to :shift
	validates_associated :shift
	belongs_to :factory
	validates_associated :factory
	has_many :orders
end

class Shift < ApplicationRecord
	belongs_to :factory
	validates :date, uniqueness: true
	validates_associated :factory
	has_many :workers
	has_many :orders
end

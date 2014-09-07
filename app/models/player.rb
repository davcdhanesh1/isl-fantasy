class Player < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 6, maximum: 64 }
  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :points, presence: true
  validates_numericality_of :points, greater_than_or_equal_to: 0
  validates :role, presence: true
  validates :franchise, presence: true, length: { minimum: 3, maximum: 16 }
end

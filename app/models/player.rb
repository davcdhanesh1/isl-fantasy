class Player < ActiveRecord::Base

  include PlayersHelper

  validates :name, presence: true, length: { minimum: 6, maximum: 64 }

  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0

  validates :points, presence: true
  validates_numericality_of :points, greater_than_or_equal_to: 0

  validates :role, presence: true, length: { minimum: 5, maximum: 16 }
            # inclusion:
  validates :franchise, presence: true, length: { minimum: 3, maximum: 32 }

  default_scope -> { order('created_at DESC') }

end

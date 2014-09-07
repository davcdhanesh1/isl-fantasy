class Player < ActiveRecord::Base

  # DELHI_DYNAMOS = 'Delhi Dynamos',
  # FC_PUNE_CITY = 'FC Pune city',
  # KERALA_BLASTER_CITY = 'Kerala Blaster City',
  # MUMBAI_CITY_FC = 'Mumbai City FC',
  # NORTHEAST_UNITED = 'NorthEast United',
  # KOLKATA_WEST_BENGAL = 'Kolkata West Bengal',
  # CHENNAI_TAMIL_NADU = 'Chennai Tamil Nadu',
  # DELHI = 'Delhi',
  # MARGAO_GOA = 'Margao, Goa',
  # PUNE_MAHA = 'Pune Mah',
  # KOCHI_KERAL = 'Kochi Kerala',
  # MUMBAI_MAHA = 'Mumbai Mah',
  # GUWAHATI = 'Guwahati, Assam']

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

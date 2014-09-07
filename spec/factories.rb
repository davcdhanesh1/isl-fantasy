FactoryGirl.define do

  factory :player do
    sequence(:name) { |n| "player-#{n}" }
    sequence(:franchise) { |n| Player::Franchise::FC_PUNE_CITY }
    sequence(:price) { |n| '3000' }
    sequence(:points) { |n| 1000 }
    sequence(:role) { |n| 'goalkeeper' }
  end

  factory :invalid_player, :parent => :player do |f|
    f.name nil
  end

end
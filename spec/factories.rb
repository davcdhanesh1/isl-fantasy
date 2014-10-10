FactoryGirl.define do

  factory :player do
    name { 'player-name' }
    franchise { 'test pune franchise' }
    price { '3000' }
    points { 1000 }
    role { 'goalkeeper' }
  end

  factory :invalid_player, :parent => :player do |f|
    f.name nil
  end

end
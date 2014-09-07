FactoryGirl.define do

  factory :player do
    sequence(:name) { |n| "player-#{n}" }
    sequence(:franchise) { |n| "franchise-#{n}" }
    sequence(:price) { |n| '3000' }
    sequence(:points) { |n| 1000 }
    sequence(:role) { |n| 'forward striker' }
  end

end
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'faker'

Rails.application.load_tasks

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    make_players
  end
end


def make_players
  30.times do |n|
    name = Faker::Name.name
    franchise = 'default'
    role = 'default'
    points = 10
    price = '1000'
    Player.create!(name: name,
                   franchise: franchise,
                   role: role,
                   points: points,
                   price: price)
  end
end

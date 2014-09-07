require 'rails_helper'

RSpec.describe Player, :type => :model do

  describe 'basic validation' do
    let(:player_1) { FactoryGirl.create(:player) }
    let(:invalid_player_1) { FactoryGirl.create(:invalid_player)}

    it { expect(player_1).to respond_to(:name) }
    it { expect(player_1).to respond_to(:franchise) }
    it { expect(player_1).to respond_to(:price) }
    it { expect(player_1).to respond_to(:points) }
    it { expect(player_1).to respond_to(:role) }
    it { expect(player_1).to be_valid }

  end

  describe 'constraints' do

    it 'should have name of minimum 8 chars' do
      invalid_player = Player.create(name: 'inval',price: 10)
      expect(invalid_player).not_to be_valid
      expect(invalid_player.errors.full_messages).to include 'Name is too short (minimum is 6 characters)'
    end

    it 'should have minimum price of 0 ' do
      invalid_player = Player.create(name: 'invalid_player',price: -1)
      expect(invalid_player).not_to be_valid
      expect(invalid_player.errors.full_messages).to include 'Price must be greater than or equal to 0'
    end

    it 'should have minimum points of 0' do
      invalid_player = Player.create(name: 'invalid_player',price: 10,points: -1)
      expect(invalid_player).not_to be_valid
      expect(invalid_player.errors.full_messages).to include 'Points must be greater than or equal to 0'
    end

    it 'should have role' do
      invalid_player = Player.create(name: 'invalid_player',price: 10,points: 20)
      expect(invalid_player).not_to be_valid
      expect(invalid_player.errors.full_messages).to include "Role can't be blank"
    end

    it 'should have franchise name' do
      invalid_player = Player.create(name: 'invalid_player',price: 10,points: 20,role: 'striker')
      expect(invalid_player).not_to be_valid
      expect(invalid_player.errors.full_messages).to include "Franchise can't be blank"
    end


  end

end

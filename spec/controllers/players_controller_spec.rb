require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do

  context 'basic action' do

    before {
      allow_any_instance_of(ApplicationController).to receive(:is_admin?).and_return(true)
    }

    describe '#index' do

      it 'should get list of all players in descending order of their creation time' do
        players = [FactoryGirl.create(:player, name: 'Player-1'), FactoryGirl.create(:player, name: 'Player-2')]

        get :index
        all_player_resource = JSON.parse(response.body)

        expect(response).to be_success
        expect(all_player_resource.count).to eq players.count
        expect(all_player_resource[0]['name']).to eq 'Player-2'
        expect(all_player_resource[1]['name']).to eq 'Player-1'
      end

    end

    describe '#create' do

      context 'with valid attributes' do
        it 'should create new player and redirect to all players page' do

          post :create, player: { name: 'player name', franchise: 'player franchise', price: '100', points: 1000,
                                  role: 'player role' }

          player_resource = JSON(response.body)

          expect(response.status).to eq 201
          expect(player_resource['name']).to eq 'player name'
          expect(player_resource['franchise']).to eq 'player franchise'
          expect(player_resource['price']).to eq '100'
          expect(player_resource['points']).to eq 1000
          expect(player_resource['role']).to eq 'player role'
        end
      end

      context 'with invalid attributes' do
        it 'should not create new player and redirect to new player page' do
          expect {
            post :create, player: FactoryGirl.attributes_for(:invalid_player)
          }.to change(Player, :count).by(0)

          expect(response.status).to eq 422
        end
      end

    end

    describe '#update' do

      context 'with valid attributes' do
        it 'should update that player and return 200' do
          player = FactoryGirl.create(:player, name: 'old name', franchise: 'old franchise', price: '10', points: 100,
                                      role: 'old role')

          put :update, id: player.id, player: { name: 'new name', franchise: 'new franchise', price: '100', points: 1000,
                                 role: 'new role'}

          get :show, id: player.id
          player_resource = JSON(response.body)

          expect(response.status).to eq 200
          expect(player_resource['name']).to eq 'new name'
          expect(player_resource['franchise']).to eq 'new franchise'
          expect(player_resource['price']).to eq '100'
          expect(player_resource['points']).to eq 1000
          expect(player_resource['role']).to eq 'new role'
        end
      end

      context 'with invalid attributes' do
        it 'should not update that player and return 304' do
          player = FactoryGirl.create(:player)

          put :update, id: player.id, player: { name: '', franchise: 'new ', price: '100', points: -5,
                                 role: 'new role'}

          expect(response.status).to eq 304
        end
      end

    end

    describe '#show' do
      it 'should get particular player' do
        first_player = FactoryGirl.create(:player,
                                          name: 'Test Player',
                                          franchise: 'Test Franchise',
                                          price: '100',
                                          points: '1000',
                                          role: 'Mid Fielder')

        get :show, id: first_player.id

        expect(response).to be_success
        player_resource = JSON.parse(response.body)

        expect(player_resource['name']).to eq 'Test Player'
        expect(player_resource['franchise']).to eq 'Test Franchise'
        expect(player_resource['price']).to eq '100'
        expect(player_resource['points']).to eq 1000
        expect(player_resource['role']).to eq 'Mid Fielder'
      end
    end

  end
end

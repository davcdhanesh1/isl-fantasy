require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do

  context 'basic action' do

    before {
      allow_any_instance_of(ApplicationController).to receive(:is_admin?).and_return(true)
    }

    describe '#index' do

      it 'should get list of all players' do
        players = [double(:player), double(:player)]
        Player.stub(:paginate) { [players] }

        get :index
        expect(response).to be_success
        expect(assigns(:players).present?).to eq true
      end

    end

    describe '#create' do

      context 'with valid attributes' do
        it 'should create new player and redirect to all players page' do
          expect {
            post :create, player: FactoryGirl.attributes_for(:player)
          }.to change(Player, :count).by(1)
          expect(response).to redirect_to(players_path)
        end
      end

      context 'with invalid attributes' do
        it 'should not create new player and redirect to new player page' do
          expect {
            post :create, player: FactoryGirl.attributes_for(:invalid_player)
          }.to change(Player, :count).by(0)
        end

        it 'should redirect back to new player' do
          invalid_player = FactoryGirl.attributes_for(:invalid_player)
          post :create, player: invalid_player
          expect(response).to render_template(:new)
        end
      end

    end

    describe '#new' do

      it 'should build object for new player ' do
        get :new
        expect(response).to be_success
        expect(assigns(:player).present?).to eq true
      end

      it 'should render new player template' do
        get :new
        expect(response).to render_template(:new)
      end

    end

    describe '#edit' do

      let(:player) { FactoryGirl.create(:player) }

      it 'should build object for player' do
        get :edit, id: player.id
        expect(response).to be_success
        expect(assigns(:player).present?).to eq true
      end

      it 'should render edit player template for that player' do
        get :edit, id: player.id
        expect(response).to render_template(:edit)
      end

    end

    describe '#update' do

      context 'with valid attributes' do
        it 'should update that player and redirect to all players page' do
          player = FactoryGirl.create(:player)

          put :update, id: player.id, player: FactoryGirl.attributes_for(:player, points: 999, name: 'new name')

          player.reload
          expect(player.name).to eq 'new name'
          expect(player.points).to eq 999
          expect(response).to redirect_to(players_path)
        end
      end

      context 'with invalid attributes' do
        it 'should not update that player and redirect back to edit player page' do
          player = FactoryGirl.create(:player)

          put :update, id: player.id, player: FactoryGirl.attributes_for(:player, points: -1)

          expect(response).to render_template(:edit)
        end
      end

    end

  end

  context 'authentication' do

    before {
      allow_any_instance_of(ApplicationController).to receive(:is_admin?).and_return(false)
    }

    describe '#new' do
      it 'should redirect back to root path if user is not admin' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    describe '#create' do
      it 'should redirect back to root path if user not admin' do
        post :create, player: FactoryGirl.attributes_for(:player)
        expect(response).to redirect_to(root_path)
      end
    end

    describe '#edit' do
      it 'should redirect back to root path if user not admin' do
        get :edit, id: :something
        expect(response).to redirect_to(root_path)
      end
    end

    describe '#update' do
      it 'should redirect back to root path if user not admin' do
        put :update, id: :something, player: FactoryGirl.attributes_for(:player)
        expect(response).to redirect_to(root_path)
      end
    end
  end

end

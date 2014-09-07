require 'rails_helper'

RSpec.describe SessionsController, :type => [:controller] do

  before(:each) do
    mock_facebook_authentication
  end

  describe '#create' do

    xit 'should set session variable and redirect to root path' do

      get :create
      expect(session[:user_id].present?).to eq true
      expect(response).to be_success
      expect(response).to redirect_to(root_path)

    end

  end

end

require 'capybara/rspec'

RSpec.configure do |config|

  config.deprecation_stream = './log/rspec.log'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.configure do |config|
    config.default_host = 'http://localhost:3000'
  end

  def mock_facebook_authentication
    OmniAuth.config.test_mode = true

    OmniAuth.config.add_mock(:facebook, {
        :provider => 'facebook',
        :uid => '730423672363072',
        :info => {
            name: 'Test User',
            email: 'test_user@gmail.com',
            image: 'http://graph.facebook.com/730423672363072/',
        },
        :credentials => {
            token: :test_user_token,
            expires_at: DateTime.now
        }
    })
  end


end

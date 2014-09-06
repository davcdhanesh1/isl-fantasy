# Authentication for facebook login
class ConfigLoader
  def initialize(config_filename)
    @filename = config_filename
  end

  def to_hash
    return Hash.new("") unless File.exists?(@filename)
    YAML::load(ERB.new(config_file.read).result(binding))[Rails.env]
  end

  private
  def config_file
    File.open(@filename)
  end
end

OmniAuth.config.logger = Rails.logger
API_CONFIG = ConfigLoader.new("#{Rails.root}/config/api_config.yml").to_hash

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, API_CONFIG['facebook_api_key'],API_CONFIG['facebook_secret_key']
end
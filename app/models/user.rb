class User < ApplicationRecord

  # Plugins
  include HasApi
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Callbacks
  before_create :ensure_auth_token

  # 
  # API Attributes
  # 
  def self.self_api_attributes
    %i(id email auth_token)
  end

  # 
  # Setup token
  # 
  def ensure_auth_token
    self.auth_token = loop do
      token = Devise.friendly_token
      break token unless User.where(auth_token: token).exists?
    end
  end
end

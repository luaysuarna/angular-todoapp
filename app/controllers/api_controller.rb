class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_default_format
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  def success_api(message = "", data = {}, respond = 200)
    { message: message, respond: respond, success: true }.merge(data)
  end

  def failed_api(message = "", data = {}, respond = 200)
    { message: message, respond: respond, success: false }.merge(data)
  end

  def authenticate_user_from_token!
    @is_using_auth_token = true

    token = params[:auth_token] if params[:auth_token].present?

    user = User.find_by(auth_token: token)

    if user && token
      @current_user = user
      sign_in user, store: false, run_callbacks: false
    end
  end

  def authenticate_user!
    if !user_signed_in?
      render json: failed_api(t('devise.failure.unauthenticated'), { status: 401 })
    end
  end

  private

    def set_default_format
      request.format = :json
    end

end

class Api::V1::SessionsController < ApiController

  skip_before_action :authenticate_user!, :authenticate_user_from_token!, only: :create

  def create
    @user = User.find_for_database_authentication email: user_params[:email]

    if @user && @user.valid_password?(user_params[:password])
      @user.ensure_auth_token
      @user.save(validate: false)
      bypass_sign_in @user
      render json: success_api(I18n.t('devise.sessions.signed_in'), { user: current_user.to_api_data(:self) })
    else
      render json: failed_api(I18n.t('devise.failure.invalid', authentication_keys: User.authentication_keys.join(',')), { status: 422 })
    end
  end

  def validate
    if user_signed_in?
      render json: success_api("You have already signed in.", { user: current_user.to_api_data(:self) })
    end
  end

  def destroy
    current_user.ensure_auth_token
    current_user.save
    render json: success_api
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

end

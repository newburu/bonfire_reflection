# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token # 必要に応じて

  def google_oauth2
    callback_from(:google)
  end

  def twitter2
    callback_from(:twitter)
  end

  private

  def callback_from(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user
      redirect_to root_path, notice: "おかえりなさい！"
    else
      Rails.logger.error "OmniAuth login failed. User errors: #{@user.errors.full_messages.join(', ')}"
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end

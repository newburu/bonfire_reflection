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
      # 資質が未登録なら登録画面へ、登録済みならトップへ
      if @user.strengths.empty?
        redirect_to strengths_setup_path, notice: "#{provider.to_s.capitalize}で認証しました。あなたの資質を教えてください。"
      else
        redirect_to root_path, notice: "おかえりなさい！"
      end
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end

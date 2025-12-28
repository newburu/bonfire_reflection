class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 twitter2]

  has_many :user_strengths, dependent: :destroy
  has_many :strengths, through: :user_strengths
  has_many :reflections, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email || "#{auth.uid}-#{auth.provider}@example.com"
      # パスワード不要だがDevise上必須な場合はダミーを入れる
      user.password = Devise.friendly_token[0, 20]
    end
  end
end

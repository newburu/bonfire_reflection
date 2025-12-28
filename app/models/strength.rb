class Strength < ApplicationRecord
  has_many :user_strengths, dependent: :destroy
  has_many :users, through: :user_strengths
end

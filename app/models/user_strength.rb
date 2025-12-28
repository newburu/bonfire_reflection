class UserStrength < ApplicationRecord
  belongs_to :user
  belongs_to :strength

  validates :strength_id, uniqueness: { scope: :user_id }
  validates :rank, uniqueness: { scope: :user_id }, inclusion: { in: 1..5 }
end

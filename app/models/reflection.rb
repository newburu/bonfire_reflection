class Reflection < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 1000 }

  scope :recent, -> { order(created_at: :asc) } # チャット風なので古い順が上、新しい順が下でも良いが、タイムライン的には最新が下に追加されるイメージ
end

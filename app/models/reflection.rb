class Reflection < ApplicationRecord
  belongs_to :user, optional: true

  enum :ai_status, { idle: 0, generating: 1, done: 2, failed: 3 }

  validates :content, presence: true, length: { maximum: 1000 }

  scope :recent, -> { order(created_at: :asc) }

  after_create_commit :broadcast_creation

  private

  def broadcast_creation
    channel = user ? "reflections_#{user.id}" : "reflections_public"
    # 自分の投稿を APPEND する
    broadcast_append_to channel, target: "reflections", partial: "reflections/reflection", locals: { reflection: self }
  end
end

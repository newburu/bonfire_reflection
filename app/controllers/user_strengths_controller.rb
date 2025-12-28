class UserStrengthsController < ApplicationController
  before_action :authenticate_user!

  def edit
    # 資質マスター取得（名前順やID順など、ユーザーが探しやすい順序が良いが今回はID順）
    @strengths = Strength.all

    # 現在の登録状況をハッシュ化 { 1 => strength_id, 2 => strength_id, ... }
    @current_strength_ids = current_user.user_strengths.pluck(:rank, :strength_id).to_h
  end

  def update
    # パラメータ: { strengths: { "1" => "id", "2" => "id", ... } }

    # バリデーション: 重複チェック
    input_ids = strength_params.values.reject(&:blank?).map(&:to_i)
    if input_ids.size != input_ids.uniq.size
      flash.now[:alert] = "同じ資質を重複して選択することはできません。"
      @strengths = Strength.all
      @current_strength_ids = strength_params.to_h.transform_keys(&:to_i).transform_values(&:to_i)
      render :edit, status: :unprocessable_entity
      return
    end

    ActiveRecord::Base.transaction do
      # 既存の登録を一旦削除（ランクの入れ替えなどが複雑になるため、洗い替えがシンプル）
      current_user.user_strengths.destroy_all

      strength_params.each do |rank, strength_id|
        next if strength_id.blank?

        current_user.user_strengths.create!(
          strength_id: strength_id,
          rank: rank.to_i
        )
      end
    end

    redirect_to root_path, notice: "資質を登録しました！"
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "登録に失敗しました: #{e.record.errors.full_messages.join(', ')}"
    @strengths = Strength.all
    @current_strength_ids = strength_params.to_h.transform_keys(&:to_i).transform_values(&:to_i)
    render :edit, status: :unprocessable_entity
  rescue => e
    flash.now[:alert] = "エラーが発生しました。"
    @strengths = Strength.all
    @current_strength_ids = strength_params.to_h.transform_keys(&:to_i).transform_values(&:to_i)
    render :edit, status: :unprocessable_entity
  end

  private

  def strength_params
    # { "1" => "10", "2" => "5", ... } の形式を想定
    params.require(:strengths).permit("1", "2", "3", "4", "5")
  end
end

class ReflectionsController < ApplicationController
  # before_action :authenticate_user! # ゲスト利用を許可するため削除

  def index
    if user_signed_in?
      @reflections = current_user.reflections.recent
    else
      @reflections = Reflection.where(user_id: nil).recent.limit(10) # ゲストは最新10件程度（または制限なし）
    end
    @reflection = Reflection.new
  end

  def create
    if user_signed_in?
      @reflection = current_user.reflections.build(reflection_params)
    else
      @reflection = Reflection.new(reflection_params)
      # user_id は nil
    end

    @reflection.ai_status = :generating

    if @reflection.save
      ReflectionQuestionJob.perform_later(@reflection.id)

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to reflections_path, notice: "Reflection was successfully created." }
      end
    else
      redirect_to reflections_path, alert: "投稿できませんでした。"
    end
  end

  private

  def reflection_params
    params.require(:reflection).permit(:content)
  end
end

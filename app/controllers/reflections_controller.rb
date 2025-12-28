class ReflectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reflections = current_user.reflections.recent
    @reflection = Reflection.new
  end

  def create
    @reflection = current_user.reflections.build(reflection_params)

    if @reflection.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to reflections_path }
      end
    else
      # エラー時は（今回は簡易的に）リダイレクトまたは再描画
      redirect_to reflections_path, alert: "投稿できませんでした。"
    end
  end

  private

  def reflection_params
    params.require(:reflection).permit(:content)
  end
end

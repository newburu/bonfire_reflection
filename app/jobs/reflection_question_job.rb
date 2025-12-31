class ReflectionQuestionJob < ApplicationJob
  queue_as :default

  def perform(reflection_id)
    reflection = Reflection.find_by(id: reflection_id)
    return unless reflection

    # 重複実行防止や、すでに生成済みの場合のガード（必要なら）
    return if reflection.ai_question.present?

    user_strengths = reflection.user&.strengths || []
    if reflection.user
      past_reflections = reflection.user.reflections.where.not(id: reflection.id).order(created_at: :desc).limit(5)
      stream_channel = "reflections_#{reflection.user.id}"
    else
      # ゲストの場合は過去のリフレクション（文脈）は考慮しない、またはセッション/Cookieベースがないので直前のものを取得できない（今回は「なし」とする）
      past_reflections = []
      stream_channel = "reflections_public"
    end

    service = GeminiService.new
    question = service.generate_question(reflection.content, user_strengths, past_reflections)

    if question.present?
      reflection.update!(ai_question: question, ai_status: :done)
      reflection.broadcast_replace_to stream_channel, target: "reflection_#{reflection.id}", partial: "reflections/reflection", locals: { reflection: reflection, animate: true }
    else
      reflection.update!(ai_status: :failed)
      # 失敗時も更新して、Thinking表示を消す（あるいはエラー表示にする）
      reflection.broadcast_replace_to stream_channel, target: "reflection_#{reflection.id}", partial: "reflections/reflection", locals: { reflection: reflection }
    end
  rescue => e
    reflection.update!(ai_status: :failed)
    raise e
  end
end

class AddAiQuestionToReflections < ActiveRecord::Migration[8.1]
  def change
    add_column :reflections, :ai_question, :text
  end
end

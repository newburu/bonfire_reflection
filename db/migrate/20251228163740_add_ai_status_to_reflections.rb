class AddAiStatusToReflections < ActiveRecord::Migration[8.1]
  def change
    add_column :reflections, :ai_status, :integer, default: 0
  end
end

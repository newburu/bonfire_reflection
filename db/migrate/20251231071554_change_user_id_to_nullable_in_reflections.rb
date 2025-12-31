class ChangeUserIdToNullableInReflections < ActiveRecord::Migration[8.1]
  def change
    change_column_null :reflections, :user_id, true
  end
end

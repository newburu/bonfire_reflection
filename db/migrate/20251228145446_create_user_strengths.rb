class CreateUserStrengths < ActiveRecord::Migration[8.1]
  def change
    create_table :user_strengths do |t|
      t.references :user, null: false, foreign_key: true
      t.references :strength, null: false, foreign_key: true
      t.integer :rank

      t.timestamps
    end
    add_index :user_strengths, [ :user_id, :strength_id ], unique: true
    add_index :user_strengths, [ :user_id, :rank ], unique: true
  end
end

class CreateStrengths < ActiveRecord::Migration[8.1]
  def change
    create_table :strengths do |t|
      t.string :name
      t.string :genius
      t.text :balcony
      t.text :basement
      t.string :opposite_trait
      t.text :opposite_description

      t.timestamps
    end
  end
end

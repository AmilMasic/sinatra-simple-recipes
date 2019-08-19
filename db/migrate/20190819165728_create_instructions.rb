class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :instructions
      t.integer :recipe_id
    end
  end
end

class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :kategory
      t.integer :cook_time
      t.text :ingredients
      t.text :instructions
      t.integer :user_id
    end
  end
end

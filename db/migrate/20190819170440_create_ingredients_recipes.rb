class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
      t.integer :recipe_id
      t.integer :ingredients_id
    end
  end
end

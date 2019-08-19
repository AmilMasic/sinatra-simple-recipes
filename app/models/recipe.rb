class Recipe < ActiveRecord::Base

  has_many :instructions
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
  belongs_to :user
end

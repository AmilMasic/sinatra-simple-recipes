class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    erb :"/recipes/index.html"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    @user = current_user
    erb :"/recipes/new.html"
  end

  # POST: /recipes
  post "/recipes" do
    @user = current_user
    @recipe = Recipe.create(params[:recipe])
    @recipe.save
    redirect "/recipes"
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    redirect "/recipes"
  end
end

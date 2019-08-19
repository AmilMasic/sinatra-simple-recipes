class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    @user = current_user
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
    @user.recipes << @recipe
    redirect "/recipes"
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    # show the specific recipe route
    @recipe = Recipe.find_by_id(params[:id])
    # find recipe
    # send user to view

    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    # after pressing edit button on show.recipes
    # load specific recipe into a var
    # route over to
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    # after submiting the edit form for recipes
    # load current recipe
    # update current recipe
    # route to specific recipe
    redirect "/recipes/:id"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    # deletes the current recipe
    # redirect to all recipes
    redirect "/recipes"
  end
end

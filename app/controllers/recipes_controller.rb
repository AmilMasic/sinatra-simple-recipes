class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    @user = current_user

    erb :"/recipes/index.html"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    # binding.pry
      redirect_if_not_logged_in
      @user = current_user
      erb :"/recipes/new.html"
  end


  # POST: /recipes
  post "/recipes" do
    # binding.pry
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
    @recipe = Recipe.create(params[:recipe])
    if @recipe.name != ""
      @recipe.save
      @user.recipes << @recipe
      redirect "/recipes"
    else
      redirect to "/recipes/new"
    end
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    # show the specific recipe route
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    # find recipe
    # send user to view

    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe && @recipe.user == current_user
    # load specific recipe into a var
    # route over to
      erb :"/recipes/edit.html"
    else
      redirect "/login"
    end
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe && @recipe.user == current_user
      @recipe.update(params[:recipe])
    else
      redirect "/recipes/#{@recipe.id}/edit"
    end
    # binding.pry
    # update current recipe
    # route to specific recipe
    redirect "/recipes/#{@recipe.id}"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && @recipe.user == current_user
        @recipe.delete
      else
      redirect to '/login'
    end
      redirect to '/recipes'
  end

end

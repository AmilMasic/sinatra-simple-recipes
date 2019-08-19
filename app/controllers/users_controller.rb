class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do

    @user = User.create(username: params["username"], email: params["email"], password: params["password"])
    @user.save
    # binding.pry
    redirect to "/users/#{@user.id}"
  end

  get '/login' do
    erb :"/users/login"
  end


  post '/login' do

    @user = User.find_by(email: params[:email])

    if @user &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to "/signup"
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end


  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find_by_id(params[:id])
    # binding.pry
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end

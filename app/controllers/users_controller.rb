class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :"/users/signup"
    else
      redirect to "/users/#{@user.id}"
    end
  end

  post '/signup' do
      if params[:username] == "" || params[:email] == "" || params[:password] == ""
        redirect to '/signup'
    else
      @user = User.create(username: params["username"], email: params["email"], password: params["password"])
      @user.save
      session[:user_id] = @user.id

      redirect to "/users/#{@user.id}"
    end
  end

  get '/login' do
    @user = current_user
    if !logged_in?
      erb :"/users/login"
    else
      redirect to "/users/#{@user.id}"
    end
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
    @user = current_user
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end


end

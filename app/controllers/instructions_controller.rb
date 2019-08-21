class InstructionsController < ApplicationController

  # GET: /instructions
  get "/instructions" do
    erb :"/instructions/index.html"
  end

  # GET: /instructions/new
  get "/instructions/new" do
    erb :"/instructions/new.html"
  end

  # POST: /instructions
  post "/instructions" do
    redirect "/instructions"
  end

  # GET: /instructions/5
  get "/instructions/:id" do
    erb :"/instructions/show.html"
  end

  # GET: /instructions/5/edit
  get "/instructions/:id/edit" do
    erb :"/instructions/edit.html"
  end

  # PATCH: /instructions/5
  patch "/instructions/:id" do
    redirect "/instructions/:id"
  end

  # DELETE: /instructions/5/delete
  delete "/instructions/:id/delete" do
    redirect "/instructions"
  end
end

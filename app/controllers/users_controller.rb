class UsersController < ApplicationController

  # # GET: /users
  # get "/users" do
  #   erb :"/users/index"
  # end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new"
  end

  # POST: /users
  post "/users" do
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    binding.pry
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5
  delete "/users/:id" do
    redirect "/users"
  end
end

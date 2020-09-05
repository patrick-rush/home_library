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
    # binding.pry
    if user.save
      session[:user_id] = user.id
      redirect "/books"
    else
      @error = "Something went wrong. Please try again."
      erb :"/users/new"
    end
  end

  get "/login" do
    if logged_in?(session)
      redirect "/books"
    else
      erb :"/users/login"
    end
  end

  post "/login" do
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/books"
    else
      @error = "Incorrect Email or Password" # -> figure out where to use this
      erb :"/users/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  # # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show"
  # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5
  # delete "/users/:id" do
  #   redirect "/users"
  # end
end

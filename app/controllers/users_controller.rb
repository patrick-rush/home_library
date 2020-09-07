class UsersController < ApplicationController

  get "/users/new" do
    if logged_in?(session)
      flash[:error] = "Oops, looks like you're already logged in! Need to create a new account? Please log out first."
      redirect "/books"
    else
      erb :"/users/new"
    end
  end

  post "/users" do
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect "/books"
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect "/users/new"
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
      flash[:error] = "Incorrect Email or Password"
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end

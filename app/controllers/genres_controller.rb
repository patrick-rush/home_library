class GenresController < ApplicationController

  # GET: /genres
  get "/genres" do
    redirect_if_not_logged_in
    @user = current_user(session)
    @books = Book.where(user_id: @user.id)
    @genres = Genre.all
    erb :"/genres/index"
  end

  # GET: /genres/new
  get "/genres/new" do
    erb :"/genres/new"
  end

  # POST: /genres
  post "/genres" do
    redirect "/genres"
  end

  # GET: /genres/5
  get "/genres/:id" do
    erb :"/genres/show"
  end

  # GET: /genres/5/edit
  get "/genres/:id/edit" do
    erb :"/genres/edit"
  end

  # PATCH: /genres/5
  patch "/genres/:id" do
    redirect "/genres/:id"
  end

  # DELETE: /genres/5/delete
  delete "/genres/:id/delete" do
    redirect "/genres"
  end
end

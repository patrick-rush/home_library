class GenresController < ApplicationController

  get "/genres" do
    redirect_if_not_logged_in
    @user = current_user(session)
    @books = Book.where(user_id: @user.id)
    @genres = Genre.all.order(:name)
    erb :"/genres/index"
  end

  get "/genres/:id" do
    redirect_if_not_logged_in
    @genre = Genre.find(params[:id])
    @books = Book.where(genre_id: @genre.id).order(:title)
    erb :"/genres/show"
  end

end

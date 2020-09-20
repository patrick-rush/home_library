class BooksController < ApplicationController

  # index
  get "/books" do 
    redirect_if_not_logged_in
    @user = current_user(session)
    # @books = Book.where(user_id: @user.id).order(:title)
    @books = @user.books.order(:title)
    erb :"/books/index"
  end

  #new
  get "/books/new" do
    redirect_if_not_logged_in
    @genres = Genre.all.order(:name)
    erb :"/books/new"
  end

  #create
  post "/books" do 
    book = Book.new(title: params[:title], author: params[:author], status: params[:status], user_id: current_user(session).id)
    unless params[:genre_id].empty?
      book.genre_id = params[:genre_id]
    end
    if book.save
      flash[:success] = "#{book.title} has been added to your library!"
      redirect "/books/#{book.id}"
    else
      flash[:error] = "New books must have a title to be saved to your library."
      redirect "/books/new"
    end
  end

  #show
  get "/books/:id" do 
    redirect_if_not_logged_in
    @book = Book.find(params[:id])
    # @genre = Genre.find_by_id(@book.genre_id) 
    @genre = @book.genre # Can do this or just call @book.genre.name in ERB file
    redirect_if_not_authorized(@book)
    erb :"/books/show"
  end

  #edit
  get "/books/:id/edit" do 
    redirect_if_not_logged_in
    @book = Book.find(params[:id])
    @genres = Genre.all.order(:name)
    redirect_if_not_authorized(@book)
    erb :"/books/edit"
  end

  #update
  patch "/books/:id" do 
    redirect_if_not_logged_in
    book = Book.find(params[:id])
    book.title = params[:title]
    book.author = params[:author]
    if params[:status] != nil
      book.status = params[:status]
    end
    unless params[:genre_id].empty?
      book.genre = Genre.find(params[:genre_id])
    end
    book.save
    flash[:success] = "#{book.title} has been updated!"
    redirect "/books/#{book.id}"
  end

  #destroy
  delete "/books/:id" do
    redirect_if_not_logged_in
    book = Book.find(params[:id])
    redirect_if_not_authorized(book)
    book.delete
    flash[:success] = "#{book.title} has been deleted from your library."
    redirect "/books"
  end
end

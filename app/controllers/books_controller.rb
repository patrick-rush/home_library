class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    @user = current_user(session)
    @books = Book.where(user_id: @user.id)
    erb :"/books/index"
  end

  # GET: /books/new
  get "/books/new" do
    if logged_in?(session)
      erb :"/books/new"
    else
      redirect "/login"
    end
  end

  # POST: /books
  post "/books" do
    book = Book.new(title: params[:title], author: params[:author], user_id: current_user(session).id)
    
    if book.save
      redirect "/books/#{book.id}"
    else
      redirect "/books/new"
    end
  end

  # GET: /books/5
  get "/books/:id" do
    @book = Book.find(params[:id])
    erb :"/books/show"
  end

  # GET: /books/5/edit
  get "/books/:id/edit" do
    @book = Book.find(params[:id])
    if logged_in?(session)
      erb :"/books/edit"
    else
      redirect "/login"
    end
  end

  # PATCH: /books/5
  patch "/books/:id" do
    book = Book.find(params[:id])
    book.title = params[:title]
    book.author = params[:author]
    # binding.pry
    book.save
    redirect "/books/#{book.id}"
  end

  # DELETE: /books/5
  delete "/books/:id" do
    redirect "/books"
  end
end

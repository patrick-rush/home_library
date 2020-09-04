class NotesController < ApplicationController

  # GET: /notes
  get "/notes" do
    @user = current_user(session)
    @books = Book.where(user_id: @user.id)
    @notes = @books.collect do |book|
      book.notes
    end
    # binding.pry
    erb :"/notes/index"
  end

  # GET: /notes/new
  get "/books/:id/notes/new" do
    @book = Book.find(params[:id])
    if logged_in?(session)
      erb :"/notes/new"
    else
      redirect "/login"
    end
  end

  # POST: /notes
  post "/notes" do
    note = Note.new(content: params[:content], book_id: params[:id])
    # binding.pry
    if note.save
      # binding.pry
      redirect "/books/#{params[:id]}"
    else
      # Add an error here
      redirect "/books/#{params[:id]}/notes/new"
    end
    redirect "/notes"
  end

  # GET: /notes/5
  get "/notes/:id" do
    erb :"/notes/show"
  end

  # GET: /notes/5/edit
  get "/notes/:id/edit" do
    erb :"/notes/edit"
  end

  # PATCH: /notes/5
  patch "/notes/:id" do
    redirect "/notes/:id"
  end

  # DELETE: /notes/5/delete
  delete "/notes/:id/delete" do
    redirect "/notes"
  end
end

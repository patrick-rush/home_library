class NotesController < ApplicationController

  # index and show not needed - the user can only see notes in the context of its book and can't see individual notes

  # new - uses /books/:id so info about book can be passed along in the route
  get "/books/:id/notes/new" do
    redirect_if_not_logged_in
    @book = Book.find(params[:id])
    erb :"/notes/new"
  end

  # create
  post "/notes" do
    redirect_if_not_logged_in
    note = Note.new(content: params[:content], book_id: params[:id])
    if note.save
      redirect "/books/#{params[:id]}"
    else
      flash[:error] = "Something went wrong! Please try again."
      redirect "/books/#{params[:id]}/notes/new"
    end
  end

  # edit
  get "/notes/:id/edit" do
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
    redirect_if_not_authorized(@note)
    erb :"/notes/edit"
  end

  # update
  patch "/notes/:id" do
    redirect_if_not_logged_in
    note = Note.find(params[:id])
    redirect_if_not_authorized(note)
    note.content = params[:content]
    note.save
    flash[:success] = "Your note has been updated."
    redirect "/books/#{note.book_id}"
  end

  # destroy
  delete "/notes/:id/delete" do
    redirect_if_not_logged_in
    note = Note.find(params[:id])
    redirect_if_not_authorized(note)
    book_id = note.book_id
    note.delete
    redirect "/books/#{book_id}"
  end
end

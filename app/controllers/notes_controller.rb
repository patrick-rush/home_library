class NotesController < ApplicationController

  get "/books/:id/notes/new" do
    redirect_if_not_logged_in
    @book = Book.find(params[:id])
    erb :"/notes/new"
  end

  post "/notes" do
    note = Note.new(content: params[:content], book_id: params[:id])
    if note.save
      redirect "/books/#{params[:id]}"
    else
      flash[:error] = "Something went wrong! Please try again."
      redirect "/books/#{params[:id]}/notes/new"
    end
  end

  get "/notes/:id/edit" do
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
    redirect_if_not_authorized(@note)
    erb :"/notes/edit"
  end

  patch "/notes/:id" do
    redirect_if_not_logged_in
    note = Note.find(params[:id])
    note.content = params[:content]
    note.save
    flash[:success] = "Your note has been updated."
    redirect "/books/#{note.book_id}"
  end

  delete "/notes/:id/delete" do
    redirect_if_not_logged_in
    note = Note.find(params[:id])
    redirect_if_not_authorized(note)
    book_id = note.book_id
    note.delete
    redirect "/books/#{book_id}"
  end
end

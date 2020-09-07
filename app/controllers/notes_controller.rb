class NotesController < ApplicationController

  # todo - add flash message to notes editor

  get "/books/:id/notes/new" do
    redirect_if_not_logged_in
    @book = Book.find(params[:id])
    erb :"/notes/new"
  end

  # POST: /notes
  post "/notes" do
    note = Note.new(content: params[:content], book_id: params[:id])
    if note.save
      redirect "/books/#{params[:id]}"
    else
      flash[:error] = "Something went wrong! Please try again."
      redirect "/books/#{params[:id]}/notes/new"
    end
    redirect "/notes"
  end

  get "/notes/:id/edit" do
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
    erb :"/notes/edit"
  end
  # Fill in notes edit  

  patch "/notes/:id" do
    redirect_if_not_logged_in
    note = Note.find(params[:id])
    note.content = params[:content]
    note.save
    redirect "/books/#{note.book_id}"
  end
  # Fill in notes id

  # DELETE: /notes/5/delete
  delete "/notes/:id/delete" do
    redirect_if_not_logged_in
    note = Note.find(params[:id])
    book_id = note.book_id
    note.delete
    redirect "/books/#{book_id}"
  end
  # Add button somewhere
end

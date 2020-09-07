require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV['SESSION_SECRET']
    set :method_override, true
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?(session)
      @user = current_user(session)
      @books = Book.where(user_id: @user.id)
    end
    erb :welcome
  end

  helpers do
    def logged_in?(session)
      !!session[:user_id]
    end

    def current_user(session)
      User.find(session[:user_id])
    end 

    def redirect_if_not_logged_in
      if !logged_in?(session)
        redirect "/login"
      end
    end

    def redirect_if_not_authorized(material)
      if material.instance_of?(Book)
        user_id = material.user_id
      elsif material.instance_of?(Note)
        book_id = material.book_id
        user_id = Book.find(book_id).user_id
      end
      if user_id != session[:user_id]
        flash[:error] = "You are not authorized to view that content."
        redirect "/books"
      end
    end
  end

end

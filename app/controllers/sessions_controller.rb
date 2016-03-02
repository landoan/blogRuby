class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to user_articles_path(user.id)
    else
      debugger
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

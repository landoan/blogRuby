class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def goBlog
    @user = User.find_by_username(params[:username])
    @articles = @user.articles
  end

  # POST /articles
  # POST /articles.json
  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_articles_path(@user.id)
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
end

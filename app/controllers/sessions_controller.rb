class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params["user"]["id"])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
  end
end

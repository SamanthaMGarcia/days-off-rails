class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env['omniauth.auth']
      @user = User.find_by(username: request.env['omniauth.auth']["info"]["username"])

      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      @user = User.find_by(username: params[:user][:username])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  end

  def logout
  end
end
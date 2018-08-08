require "simple-password-gen"
class SessionsController < ApplicationController

  def new
  end

  def create
      if auth
        @user = User.find_or_create_by(username: auth["info"]["email"]) do |u|
          u.password = Password.pronounceable 9
        end

      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(current_user)
      end

    else #regular login below

      @user = User.find_or_create_by(username: params[:user][:username])
      if params[:user][:username].empty? || params[:user][:password].empty?
        flash.now[:error] = @user.errors.full_messages
        render :new

      elsif !@user.save
        flash.now[:error] = "We've encountered an issue, please try again."

      else @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(current_user)
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end

  def auth
    request.env['omniauth.auth']
  end
end

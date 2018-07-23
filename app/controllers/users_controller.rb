class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    @user.save
    redirect_to user_path(@user)
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @request = Request.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = "An error occured with your log in, please try again."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

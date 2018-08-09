class TitlesController < ApplicationController
  def new
    @title = Title.new(user_id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:id])
    @title = Title.new(params[:title])

    if @title.save
      redirect_to user_path(current_user)
    else
      render :new
  end
end

class TitlesController < ApplicationController
  def new
    @title = Title.new
  end

  def show
    @title = Title.find_by(params[:title_id])
  end

  def create
    @user = User.find(params[:user_id])
    @title = Title.new(title_params)

    if @title.save
      redirect_to user_title_path(@user, @title)
    else
      render :new
    end
  end

  private

  def title_params
    params.require(:title).permit(:title_name, :user_id)
  end
end

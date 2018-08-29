class TitlesController < ApplicationController
  def new
    @title = Title.new
  end

  def index
    user = User.find_by(id: params[:user_id])
    @titles = user.titles
  end

  def create
    @user = User.find(params[:user_id])
    @title = Title.new(title_params)
    if @title.save
      redirect_to user_titles_path(@user, @titles)
    else
      render :new
    end
  end

  private

  def title_params
    params.require(:title).permit(:title_name, :user_id, :title_id)
  end
end

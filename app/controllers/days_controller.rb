class DaysController < ApplicationController
  def show
  end

  def index
    @days = Day.all
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to days_path
    else
      render :new
    end
  end

  def edit
    @day = Day.find(day_params)
  end

  def update
    @day = Day.find(day_params)
    if @game.update(day_params)
      flash[:notice] = "Your submission has been amended."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Your submission failed to update."
      render :edit
    end
  end

  def destroy
  end

  private
    def day_params
      params.require(:day).permit(:dayoff)
    end
end

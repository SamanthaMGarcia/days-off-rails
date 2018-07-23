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
  end

  def update
  end

  def destroy
  end

  private
    def day_params
      params.require(:day).permit(:dayoff)
    end
end

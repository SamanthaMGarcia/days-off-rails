class DaysController < ApplicationController
  def show
  end

  def index
    @days = Day.all
  end

  private
    def day_params
      params.require(:day).permit(:dayoff)
    end
end

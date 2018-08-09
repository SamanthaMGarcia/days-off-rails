class DaysController < ApplicationController
  def show
  end

  def index
    @days = Day.all
  end

  # def sorted_days
  #   @days = Day.all
  # end

  private
    def day_params
      params.require(:day).permit(:dayoff)
    end
end

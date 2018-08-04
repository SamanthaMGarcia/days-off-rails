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
    @day = current_user.days.build(day_params)
    if @day.save
      redirect_to days_path
    else
      flash.now[:error] = @day.errors.full_messages
      render :new
    end
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    if @day.update(day_params)
      redirect_to user_path(current_user)
    else
      flash.now[:error] = @day.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
    def day_params
      params.require(:day).permit(:dayoff :requests_attribute =>[:reason])
    end
end

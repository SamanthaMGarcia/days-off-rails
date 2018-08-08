class RequestsController < ApplicationController
  before_action :access_allowed

  def create
    @user = User.find_by(id: params[:id])
    @request = Request.new(request_params)

    if @request.save
      redirect_to user_path(current_user)
    else
       flash.now[:error] = @request.errors.full_messages
       render :new
    end
  end

  #
  # def create
  #   @day = current_user.days.build(day_params)
  #   if @day.save
  #     redirect_to days_path
  #   else
  #     flash.now[:error] = @day.errors.full_messages
  #     render :new
  #   end
  # end

  def edit
    @request = Request.find_by(id: params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to user_path(current_user)
    else
      flash.now[:error] = @request.errors.full_messages
      render :edit
    end
  end

  def destroy
    @request = Request.find_by(id: params[:id])
    @request.destroy
  end

  private
    def request_params
      params.require(:request).permit(:user_id, :day_id, :reason, day_attributes:[:dayoff])
    end
    
    def access_allowed
      @request = Request.find(params[:id])
      if @request.user != current_user
        redirect_to user_path
      end
    end
end

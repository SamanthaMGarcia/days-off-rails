class RequestsController < ApplicationController

  def create
    request = Request.new(request_params)

    if request.save
      redirect_to user_path(request.user)
    end
  end

  private
    def request_params
      params.require(:request).permit(:user_id, :day_id, :reason, day_attributes:[:dayoff])
    end
end

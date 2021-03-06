class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

 def current_user
   @current_user ||= User.find_by(id: session[:user_id])
 end

 def logged_in?
   !!current_user
 end

 def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end

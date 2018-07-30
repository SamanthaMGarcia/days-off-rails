require 'rack-flash'

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  configure do
    use Rack::Flash
  end

 def home
 end

 def current_user
   @current_user ||= User.find_by(id: session[:user_id])
 end

 def logged_in?
   !!current_user
 end
end

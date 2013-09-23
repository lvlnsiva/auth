class ApplicationController < ActionController::Base
  
 
  protect_from_forgery
  
  helper_method :current_user, :user_is_logged_in?, :require_login, :send_mail_forget_password
  
  private

  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_is_logged_in?
    !!session[:user_id]
  end
   def require_login
    unless user_is_logged_in?
      redirect_to log_in_url, :alert => "You must be logged in to access this section" # halts request cycle
    end
   end
  
  
end

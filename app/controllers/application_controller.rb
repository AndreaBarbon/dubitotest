class ApplicationController < ActionController::Base
  protect_from_forgery  

  helper_method :current_user
  before_filter :authenticate
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate
    deny_access if current_user.nil?
  end
  
  def deny_access
      redirect_to "/sessions/login"
  end

end


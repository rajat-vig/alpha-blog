class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in? #these methods will be available to views
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #memorization : if current_user else user.find
  end
  
  def logged_in?
    !!current_user #!! convert to boolean
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end

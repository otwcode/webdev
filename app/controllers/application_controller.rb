class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access Denied. Please ask Sidra for help"
    redirect_to root_url
  end

  helper_method :current_user

  private

  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end  

end

class UserSessionsController < ApplicationController
  def new
    session[:user_id] = nil
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user.is_a? User
      session[:user_id] = user.id
      flash[:notice] = 'Hello.' 
      redirect_to root_url
    else
      flash.now.alert = "Invalid login or password. Passwords have all been reset. Please ask Sidra for assistance"  
      render :action => "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Good-bye.'
    redirect_to root_url
  end
end

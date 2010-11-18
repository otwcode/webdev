class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.order('login ASC')
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      if current_user && current_user.admin? 
        @user.update_attribute(:admin, params[:user][:admin])
      end
      UserMailer.new_request("requests@transformativeworks.org", @user).deliver
      flash[:notice] = 'User was created. Email sent to Systems for setup.'
      redirect_to(@user)
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      if current_user && current_user.admin? 
        @user.update_attribute(:admin, params[:user][:admin])
      end
      UserMailer.update_request("ambtus@gmail.com", @user).deliver
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user)
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to(users_url)
  end

  def mailer_request
    render 'user_mailer/new_request', :layout => false and return
  end
  def mailer_update
    render 'user_mailer/update_request', :layout => false and return
  end

  private
  def load_user
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
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
      flash[:notice] = 'User was created. Email sent to admins for setup.'
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
      UserMailer.deliver_update("ambtus@gmail.com", @user)
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

  # so can view mailer request later
  # not currently linked anywhere
  # visible to admin onl
  def mailer_request
    render 'user_mailer/request', :layout => false and return
  end
  def mailer_update
    render 'user_mailer/update', :layout => false and return
  end

  private
  def load_user
    @user = User.find(params[:id])
  end
end

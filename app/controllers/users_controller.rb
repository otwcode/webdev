class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    unauthorized! if cannot? :create, @user
  end

  def create
    @user = User.new(params[:user])
    unauthorized! if cannot? :create, @user
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
    @user = User.find(params[:id])
    unauthorized! if cannot? :update, @user
  end

  def update
    @user = User.find(params[:id])
    unauthorized! if cannot? :update, @user
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
    @user = User.find(params[:id])
    unauthorized! if cannot? :destroy, @user
    @user.destroy
    redirect_to(users_url)
  end
end

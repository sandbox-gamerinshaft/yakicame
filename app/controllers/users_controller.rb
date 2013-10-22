class UsersController < ApplicationController
  def index
   @users = User.except_user(current_user.id).all
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:name])
    @users = User.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follows.create(followed_user: @user)
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.follows.find_by_followed_id(@user.id)
    @follow.destroy
    redirect_to users_path
  end
end

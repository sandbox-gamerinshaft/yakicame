class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follows.create(followed_user: @user)
    redirect_to users_path
  end  
end

class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    current_user.follow(@user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end

  def followings
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end

class UserFollowingsController < ApplicationController
  def create
    @user_following = UserFollowing.new(follower_id: current_user.id, following_id: params[:following_id])
    unless @user_following.save
      flash.alert = @user_following.errors.messages.values.join("\n")
    end
    redirect_back fallback_location: root_path
  end
end

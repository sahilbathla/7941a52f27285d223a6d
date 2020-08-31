class UserTopicsController < ApplicationController
  def create
    @user_topic = UserTopic.new(user_id: current_user.id, topic_id: params[:topic_id])
    unless @user_topic.save
      flash.alert = @user_topic.errors.messages.values.join("\n")
    end
    redirect_back fallback_location: root_path
  end
end

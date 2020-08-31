class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))
    unless @answer.save
      flash.alert = @answer.errors.full_messages.join("\n")
    end
    redirect_back fallback_location: root_path
  end
  
  private
  
  def answer_params
    params.permit(:question_id, :description)
  end
end

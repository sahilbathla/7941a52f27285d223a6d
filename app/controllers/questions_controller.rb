class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('created_at DESC')
  end
  
  def show
    @question = Question.find_by(id: params[:id])
    @author = @question.user
    if @question.nil?
      flash.alert = I18n.t('questions.not_found')
      redirect_to(action: :index) && return
    end
  end

  def create
    @question = Question.create(question_params.merge(user_id: current_user.id))
    unless @question.save
      flash.alert = @question.errors.full_messages.join("\n")
    end
    redirect_back fallback_location: root_path
  end

  private

  def question_params
    params.permit(:description, :topic_id)
  end
end

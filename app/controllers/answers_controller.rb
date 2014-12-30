class AnswersController < ApplicationController

  def new
    activity= Activity.find(params[:id])
    @activity_name = activity.name
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params.require(:answer).permit(:name, :notes, :status))
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to relationship_path
    else
      redirect_to relationship_path
    end
  end

end

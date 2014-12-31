class AnswersController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params.require(:answer).permit(:name, :notes, :status))
    user_relationship = UserRelationship.find_by(relationship_id: params[:relationship_id])
    @answer.user_relationship_id = user_relationship.id
    if @answer.save
      redirect_to relationship_path(params[:relationship_id])
    else
      redirect_to relationship_path(params[:relationship_id])
    end
  end

  def edit
    @answer = Answer.find(params[:answer_id])
  end

  def update

  end
end

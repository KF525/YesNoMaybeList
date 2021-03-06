class RelationshipsController < ApplicationController

  def create
    relationship = Relationship.new(params.require(:relationship).permit(:name))
    if relationship.save
      user_relationship = UserRelationship.new
      user_relationship.user_id = current_user.id
      user_relationship.relationship_id = relationship.id
      user_relationship.save!
      redirect_to relationship_path(relationship.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def show
    @relationship = Relationship.find(params[:id])
    @partners = User.partners(params[:id])
    @yes_answers = Answer.yes_answers(params[:id])
    @no_answers = Answer.no_answers(params[:id])
    @maybe_answers = Answer.maybe_answers(params[:id])
    #@activities = Activity.not_answered(params[:id])
    @activities = Activity.all
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.destroy
      redirect_to user_path(current_user.id)
    end
  end
end

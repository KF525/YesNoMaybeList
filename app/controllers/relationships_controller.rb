class RelationshipsController < ApplicationController

  def create
    relationship = Relationship.new
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
    #bug with user_relationship here
    @relationship = Relationship.find(params[:id])
    @partners = User.partners(params[:id])
    @answers = Answer.where(user_relationship_id: params[:id])
    @activities = Activity.all #all activities that haven't been answered: Activity.where.not(name:
  end

  def destroy
  end
end

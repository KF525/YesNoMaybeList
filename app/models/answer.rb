class Answer < ActiveRecord::Base
  has_many :activities
  belongs_to :user_relationship

  def self.relationship_answers(relationship_id) #finds all answers associated with relationship
    user_relationships = Relationship.user_relationships_by_relationship(relationship_id)
    relationship_answers = user_relationships.collect do |user_relationship|
      Answer.where(user_relationship_id: user_relationship.id)
    end
    relationship_answers.flatten
  end

  def self.user_and_relationship_answers(relationship_id, current_user) #finds all answers made by a user for specific relationship
    user_relationship = Relationship.find_relationship(relationship_id, current_user)
    Answer.where(user_relationship_id: user_relationship.id)
  end

  def user_relationship(relationship_id) #finds user_relationship of a specific answer
    UserRelationship.find_by(relationship_id: relationship_id)
  end

  def answered_by_current_user?(current_user, relationship_id) #checks if specific answer was entered by current_user
    user_relationship(relationship_id).user_id == current_user.id
  end
end

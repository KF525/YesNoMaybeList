class Relationship < ActiveRecord::Base
  has_many :user_relationships

  def self.user_lists(current_user)
    user_relationships = User.user_relationships(current_user)
    user_lists = user_relationships.collect do |user_relationship|
      Relationship.where(id: user_relationship.relationship_id)
    end
    user_lists.flatten
  end

  def self.user_relationship(relationship_id, current_user) #finds specific user_relationship
    UserRelationship.find_by("relationship_id = ? AND user_id = ?", relationship_id, current_user)
  end

  def belongs_to_current_user?(relationship_id, current_user) #checks that list belongs to current_user
    user_relationship = Relationship.user_relationship(relationship_id, current_user)
    user_relationship.user_id == current_user.id
  end
end

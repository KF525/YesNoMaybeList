class Relationship < ActiveRecord::Base
  has_many :user_relationships

  def self.belonging_to_user(current_user) #finds all relationships for a given user
    user_lists = Relationship.user_relationships_by_user(current_user).collect do |user_relationship|
      Relationship.where(id: user_relationship.relationship_id)
    end
    user_lists.flatten
  end

  def self.user_relationships_by_relationship(relationship_id) #finds all user_relationships associated with relationship
    UserRelationship.where("relationship_id = ?", relationship_id)
  end

  def self.user_relationships_by_user(current_user) #finds all user_relationships associated with user
    UserRelationship.where("user_id = ?", current_user)
  end

  def self.find_relationship(relationship_id, current_user) #finds specific user_relationship
    UserRelationship.find_by("relationship_id = ? AND user_id = ?", relationship_id, current_user)
  end

  def belongs_to_current_user?(relationship_id, current_user) #checks that relationship/list belongs to current_user
      user_relationship = Relationship.find_relationship(relationship_id, current_user)
    if user_relationship == nil
      false
    else
      user_relationship.user_id == current_user.id
    end
  end
end

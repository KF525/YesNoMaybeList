class Relationship < ActiveRecord::Base
  has_many :user_relationships

  def self.user_lists(current_user)
    user_relationships = User.user_relationships(current_user)
    user_lists = user_relationships.collect do |user_relationship|
      Relationship.where(id: user_relationship.relationship_id)
    end
    user_lists.flatten
  end
end

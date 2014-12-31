class Relationship < ActiveRecord::Base
  has_many :user_relationships

  def self.user_lists
    raise
    #
    #Relationship.where(user_relationship_id: user_relationships.id)
  end
end

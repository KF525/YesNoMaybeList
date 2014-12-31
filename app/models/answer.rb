class Answer < ActiveRecord::Base
  has_many :activities
  belongs_to :user_relationship

  def self.relationship_answers(relationship_id)
    user_relationships = UserRelationship.where(relationship_id: relationship_id)
    user_relationships.collect do |user_relationship|
      Answer.find_by(user_relationship_id: user_relationship.id)
    end
  end

end

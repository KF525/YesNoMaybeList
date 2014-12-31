class Activity < ActiveRecord::Base
  belongs_to :answer
  validates :name, presence: true, uniqueness: true

  def self.not_answered(current_user, relationship_id) #activities not answered by user in specific relationship
    user_answers = User.self.answers(current_user, relationship_id)
    Activity.select { |activity| activity.name != user_answers.name }
  end
end

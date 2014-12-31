class Activity < ActiveRecord::Base
  belongs_to :answer
  validates :name, presence: true, uniqueness: true

  def self.already_answered(current_user, relationship_id) #activities not answered by user in specific relationship
    answered_names = []
    answered = Answer.user_and_relationship_answers(relationship_id, current_user)
    answered.each do |answered|
      answered_names << answered.name
    end
    Activity.all_activity_names - answered_names
  end

  def self.all_activity_names
    activity_names = []
    Activity.all.each do |activity|
      activity_names << activity.name
    end
  end
end

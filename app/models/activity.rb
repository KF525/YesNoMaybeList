class Activity < ActiveRecord::Base
  belongs_to :answer
  validates :name, presence: true, uniqueness: true

  def self.not_answered(relationship_id)
    @answers = Answer.relationship_answers(relationship_id)
    # @answers.each do |answer|
    #   Activity.where.not()#all activities that haven't been answered: Activity.where.not(name:
    # end
  end
end

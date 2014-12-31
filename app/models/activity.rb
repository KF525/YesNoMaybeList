class Activity < ActiveRecord::Base
  belongs_to :answer
  validates :name, presence: true, uniqueness: true

  def self.not_answered(relationship_id)
    @answers = Answer.relationship_answers(relationship_id)
    not_answered = []
    @answers.each do |answer|
      not_answered << Activity.all.where.not(name: answer.name)
    end

  end
end

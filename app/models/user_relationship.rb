class UserRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :relationship
  has_many :answers

end

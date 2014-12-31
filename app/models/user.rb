class User < ActiveRecord::Base
  has_secure_password
  has_many :user_relationships

  #attr_accessible :email, :password, :password_confirmation
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\S+@.+\.\S+\z/ }

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def self.partners(relationship_id)
    @relationships = UserRelationship.where(relationship_id: relationship_id)
    @relationships.collect do |relationship|
      User.find(relationship.user_id)
    end
  end

  def user_is_admin?
    self.admin
  end

  def self.user_relationships(current_user) #returns all users user_relationships
    UserRelationship.where(user_id: current_user.id)
  end

  def self.user_relationship(current_user, relationship_id) #returns single user_relationship
    UserRelationship.find_by("user_id = ? AND relationship_id = ?", current_user, relationship_id)
  end

  def self.all_answers(current_user) #returns all user answers for all relationships
    Answer.where(User.user_relationships(current_user))
  end

  def self.answers(current_user, relationship_id) #returns user answers for a specific relationship
    user_relationship = self.user_relationship(current_user, relationship_id)
    Answer.where("user_relationship_id = ?", user_relationship.id)
  end
end

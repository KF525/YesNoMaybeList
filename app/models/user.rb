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

  def self.user_relationships(current_user)
    UserRelationship.where(user_id: current_user.id)
  end

  def self.answers(current_user)
    Answer.where(User.user_relationships(current_user))
  end
end

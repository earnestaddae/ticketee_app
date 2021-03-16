class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # scope to fetch non-archived users
  scope :active, lambda { where(archived_at: nil) }

  # calls the to_s method to display email and admin status
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  # archiving a User
  def archive!
    self.update(archived_at: Time.now)
  end

  # checks whether a user is authenticated to sign in
  def active_for_authentication?
    super && archived_at.nil?
  end

  # display the right message to inform user they are archived
  def inactive_message
    archived_at.nil? ? super : :archived
  end
end

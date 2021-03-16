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
end

class Project < ApplicationRecord
  # has_many :tickets, dependent: :destroy # with a callback
  has_many :tickets, dependent: :delete_all # deletes all associated tickets to a project w/o callbacks
  validates :name, presence: true
end

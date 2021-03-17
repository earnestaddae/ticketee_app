class State < ApplicationRecord

  def to_s
    name
  end

  # class default method on State
  def self.default
    find_by(default: true)
  end

  # state default maker
  def make_default!
    State.update_all(default: false)
    update!(default: true)
  end
end

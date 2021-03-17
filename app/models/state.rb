class State < ApplicationRecord

  def to_s
    name
  end

  # state default maker
  def make_default!
    State.update_all(default: false)
    update!(default: true)
  end
end

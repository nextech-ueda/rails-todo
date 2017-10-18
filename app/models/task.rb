class Task < ApplicationRecord
  scope :incomplete, ->() { where(done: false)}
  scope :completed, ->() { where(done: true)}

  def complete
    self.done = true
    save
  end
end

class Todo < ApplicationRecord
  validates_presence_of :title, :due_date

  def overdue
    return DateTime.now > self.due_date
  end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates_presence_of :name , :due_date , :note
end

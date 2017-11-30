class Note < ActiveRecord::Base
  # Remember to create a migration!
  validates :name_student, :student, presence: true
  belongs_to :teacher #aca va en singular por el belongs 
end

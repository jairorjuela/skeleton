class Teacher < ActiveRecord::Base
  # Remember to create a migration!
  has_many :notes #aca es en plural por el has 
end

require 'faker'

10.times do |i|
  Note.create(name_student: Faker::StarWars.character, student: rand(10) + 1, group: Faker::StarWars.planet, score: rand(5) +1)
end

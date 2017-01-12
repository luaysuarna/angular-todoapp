(1..30).each do |i|
  Task.create(name: Faker::Name.name, description: Faker::Lorem.sentence)
end

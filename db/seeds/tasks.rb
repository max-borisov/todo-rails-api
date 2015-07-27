if Rails.env == 'production'
  netguru     = Project.where('title iLIKE ?', '%netguru%').take
  ruby_garage = Project.where('title iLIKE ?', '%garage%').take
  ihub        = Project.where('title iLIKE ?', '%ihub%').take
else
  netguru     = Project.where('title LIKE ?', '%netguru%').take
  ruby_garage = Project.where('title LIKE ?', '%garage%').take
  ihub        = Project.where('title LIKE ?', '%ihub%').take
end

3.times do
  netguru.tasks.create!(
    description: Faker::Lorem.paragraph,
    completed: true)
end

2.times do
  ruby_garage.tasks.create!(
    description: Faker::Lorem.paragraph,
    completed: true)
end

4.times do
  ihub.tasks.create!(
    description: Faker::Lorem.paragraph,
    completed: false)
end

puts("#{Task.count} tasks(s) have been created")

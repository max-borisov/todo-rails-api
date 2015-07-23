netguru     = Project.where('title LIKE ?', '%netguru%').take
ruby_garage = Project.where('title LIKE ?', '%garage%').take
ihub        = Project.where('title LIKE ?', '%ihub%').take

3.times do
  netguru.tasks.create!(
    description: 'bla bla vla bla',
    completed: false)
end

2.times do
  ruby_garage.tasks.create!(
    description: 'bla bla vla bla',
    completed: true)
end

4.times do
  ihub.tasks.create!(
    description: 'bla bla vla bla',
    completed: false)
end

puts("#{Task.count} tasks(s) have been created")

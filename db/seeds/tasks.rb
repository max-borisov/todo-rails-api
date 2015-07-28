if Rails.env == 'production'
  netguru     = Project.where('title iLIKE ?', '%netguru%').take
  career      = Project.where('title iLIKE ?', '%career%').take
  ihub        = Project.where('title iLIKE ?', '%ihub%').take
else
  netguru     = Project.where('title LIKE ?', '%netguru%').take
  career      = Project.where('title LIKE ?', '%career%').take
  ihub        = Project.where('title LIKE ?', '%ihub%').take
end

netguru.tasks.create!([
  {
    description: 'Clone repo. Check Gemfile. Install dependencies.',
    completed: true
  },
  {
    description: 'Fix model and controller tests.',
    completed: true
  },
  {
    description: 'Configure Devise views.',
    completed: true
  },
  {
    description: 'Deploy app to TravisCI and Heroku',
    completed: true
  },
])

ihub.tasks.create!([
  {
    description: 'Make a demo bookshelf app using Rails.',
    completed: true
  },
  {
    description: 'Deploy app to heroku.',
    completed: true
  },
  {
    description: 'Prepare step-by-step tutorial.',
    completed: true
  },
  {
    description: 'Make slides for presentation.',
    completed: true
  },
  {
    description: 'Have a fun at afterparty.',
    completed: true
  },
])

career.tasks.create!([
  {
    description: 'Build 4 demo apps using Rails. Use Rspec tool for testing.',
    completed: true
  },
  {
    description: 'Deploy all apps to TravisCI, Heroku and Codeclimate.',
    completed: true
  },
  {
    description: 'Try Rubocop to analyze code.',
    completed: true
  },
  {
    description: 'Update CV.',
    completed: true
  },
  {
    description: 'Apply for the job at Netguru. Be very excited about it.',
    completed: true
  },
  {
    description: 'Pass the interview and get a job offer :)',
  }
])

# 3.times do
#   netguru.tasks.create!(
#     description: Faker::Lorem.paragraph,
#     completed: true)
# end

# 2.times do
#   ruby_garage.tasks.create!(
#     description: Faker::Lorem.paragraph,
#     completed: true)
# end

# 4.times do
#   ihub.tasks.create!(
#     description: Faker::Lorem.paragraph,
#     completed: false)
# end

puts("#{Task.count} tasks(s) have been created")

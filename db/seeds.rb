puts '*** Clean tasks'
Task.destroy_all

puts '*** Clean projects'
Project.destroy_all

require_relative('./seeds/projects')
require_relative('./seeds/tasks')

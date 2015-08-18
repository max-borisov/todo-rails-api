class Project < ActiveRecord::Base
  has_many :tasks, -> { order('position ASC, created_at ASC') }, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250 }

  def as_json(options: {})
    super(except: [:created_at, :updated_at], include: { tasks: { except: [:project_id, :position, :created_at, :updated_at] } })
  end

  # def self.all_records
  #   result = []
  #   projects = self.select(:id, :title).includes(:tasks).order(created_at: :asc).all
  #   projects.each do |project|
  #     data = {
  #      id: project.id,
  #      title: project.title,
  #      tasks: project.tasks.select(:id, :description, :completed)
  #     }
  #     result.push(data)
  #   end
  #   result
  # end
end

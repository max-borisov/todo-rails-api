class Project < ActiveRecord::Base
  has_many :tasks, -> { order('position ASC, created_at ASC') }, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
end

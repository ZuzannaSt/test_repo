class Project < ActiveRecord::Base
  has_many :users, through: :project_people
  has_many :branches
  has_many :commits
end

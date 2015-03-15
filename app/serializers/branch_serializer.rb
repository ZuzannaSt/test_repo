class BranchSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :user
  has_many :commits

  url :branch
end

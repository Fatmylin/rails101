class Group < ApplicationRecord
  validates_presence_of :title, :description

  has_many :posts, dependent: :destroy
  has_many :group_relationships
  has_many :members, through: :group_relationships, source: :user
end

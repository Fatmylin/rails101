class Group < ApplicationRecord
  validates_presence_of :title, :description

  belongs_to :user
  has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
  validates_presence_of :context

  belongs_to :user
  belongs_to :group
end

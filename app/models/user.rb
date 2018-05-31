class User < ApplicationRecord
  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :group_relationships
  has_many :participated_groups, through: :group_relationships, source: :group

  def is_member_of?(group)
     participated_groups.include?(group)
   end 
end

class User < ApplicationRecord
  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :participated_groups, through: :group_users, source: :group

  def member_of?(group)
    participated_groups.include?(group)
  end

  def join!(group)
    if self.member_of?(group)
      false
    else
      participated_groups << group
    end
  end

  def quit!(group)
    if self.member_of?(group)
      participated_groups.delete(group)
    else
      false
    end
  end

  def admin_of?(group)
    id == group.user_id
  end
end

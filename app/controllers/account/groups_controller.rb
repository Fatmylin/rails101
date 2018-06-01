class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups_info = GroupUser.includes(:group).where('user_id = ?', current_user.id)
  end
end

class Account::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :should_have_group, except: %i[index]

  def index
    @groups = Group.includes(:user).where('user_id = ?', current_user.id)
  end

  def edit; end

  def update
    redirect_to(group_path(@group), notice: @group.update(group_params) ? '更新成功' : '更新失敗')
  end

  def destroy
    redirect_to(account_groups_path, notice: @group.destroy ? '刪除成功' : '刪除失敗')
  end

  private

  def group_params
    params.require(:grou).permit(:title, :description)
  end

  def should_have_group
    @group = Group.find_by(id: params[:id])
  end
end

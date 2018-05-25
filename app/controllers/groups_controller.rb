class GroupsController < ApplicationController
  before_action :should_have_group, only: [:edit, :update, :destroy, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to(groups_path, notice: '新增成功')
    else
      render(:new)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to(groups_path, notice: '更新成功')
    else
      redirect_to(groups_path, alert: '更新失敗')
    end
  end

  def destroy
    if @group.destroy
      redirect_to(groups_path, notice: '刪除成功')
    else
      redirect_to(groups_path, alert: '刪除失敗')
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def should_have_group
    @group = Group.find_by(id: params[:id])

    head(404) if @group.nil?
  end
end

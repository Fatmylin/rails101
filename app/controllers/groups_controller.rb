class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params

    if @group.save
      redirect_to groups_path, notice: "新增成功"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @group.update group_params
    redirect_to groups_path, notice: "更新成功"
  end

  def destroy
    if @group.destroy
      redirect_to groups_path, alert: "刪除成功"
    end
  end

private
  def group_params
    params.require(:group).permit(:title, :description)
  end

  def set_group
    @group = Group.find params[:id]
  end
end

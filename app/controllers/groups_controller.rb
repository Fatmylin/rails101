class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :delete, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def delete
    
  end

private
  def group_params
    params.require(:group).permit(:title, :description)
  end

  def set_group
    @group = Group.find params[:id]
  end
end

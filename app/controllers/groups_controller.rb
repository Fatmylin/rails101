class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params

    if @group.save
      redirect_to :index
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
end

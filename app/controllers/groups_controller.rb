class GroupsController < ApplicationController
  before_action :should_have_group, only: %i[edit update destroy show join quit]
  before_action :authenticate_user!, except: %i[index show]
  before_action :should_be_group_owner, only: %i[edit update destroy]

  def index
    @groups_info = Group.deep_pluck(:title, :description, :id, 'user' => [:name, :id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to(group_path(@group), notice: '新增成功')
    else
      render(:new)
    end
  end

  def show
    @posts = @group.posts.includes(:user).recent.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to(group_path(@group), notice: '更新成功')
    else
      redirect_to(group_path(@group), alert: '更新失敗')
    end
  end

  def destroy
    if @group.destroy
      redirect_to(groups_path, notice: '刪除成功')
    else
      redirect_to(groups_path, alert: '刪除失敗')
    end
  end

  def join
    if !current_user.member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = '歡迎上車！坐穩啦～'
    else
      flash[:warning] = '你已經是群組成員！'
    end

    redirect_to(group_path(@group))
  end

  def quit
    if current_user.member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = '你達達的馬蹄聲是我美麗的錯誤～再見我的過客'
    else
      flash[:warning] = '你 484 很討厭我們？'
    end

    redirect_to(group_path(@group))
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def should_have_group
    @group = Group.find_by(id: params[:id])

    head(404) if @group.nil?
  end

  def should_be_group_owner
    redirect_to groups_path if current_user.id != @group.user.id
  end
end

class PostsController < ApplicationController
  before_action :should_have_group
  before_action :should_have_post, only: %i[edit update destroy]
  before_action :should_be_post_owner, only: %i[edit update destroy]

  def new
    @post = Post.new
  end

  def create
    @post = @group.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to(group_path(@group), notice: '新增成功')
    else
      render :new
    end
  end

  def edit; end

  def update
    redirect_to(group_path(@group), notice: @post.update(post_params) ? '更新成功' : '更新失敗')
  end

  def destroy
    redirect_to(group_path(@group), notice: @post.destroy ? '刪除成功' : '刪除失敗')
  end

  private

  def should_have_group
    @group = Group.find_by(id: params[:group_id])

    head(404) if @group.nil?

    redirect_to(group_path(@group), alert: '你不是會員喔！') if !current_user.member_of?(@group)
  end

  def post_params
    params.require(:post).permit(:context)
  end

  def should_have_post
    @post = Post.find_by(id: params[:id])

    head(404) if @post.nil?
  end

  def should_be_post_owner
    redirect_to group_path(@group) if current_user.id != @post.user.id
  end
end

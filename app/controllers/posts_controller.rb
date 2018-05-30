class PostsController < ApplicationController
  before_action :should_have_group

  def new
    @post = Post.new
  end

  def create
    @post = @group.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def should_have_group
    @group = Group.find_by(id: params[:group_id])

    head(404) if @group.nil?
  end

  def post_params
    params.require(:post).permit(:context)
  end
end

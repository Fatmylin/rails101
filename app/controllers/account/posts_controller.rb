class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :should_have_post, only: %i[edit update destroy]

  def index
    @posts = current_user.posts.includes(:group)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to(account_posts_path, notice: '更新成功')
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to(account_posts_path, notice: '刪除成功')
    else
      redirect_to(account_posts_path, notice: '刪除失敗')
    end
  end

  private

  def post_params
    params.require(:post).permit(:context)
  end

  def should_have_post
    @post = Post.find_by(id: params[:id])

    head(404) if @post.nil?
  end
end

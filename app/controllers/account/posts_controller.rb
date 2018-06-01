class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :should_have_post, except: %i[index]

  def index
    @posts = Post.includes(:user, :group).where('user_id = ?', current_user.id)
  end

  def edit; end

  def update
    redirect_to(account_posts_path, notice: @post.update(post_params) ? '更新成功' : '更新失敗')
  end

  def destroy
    redirect_to(account_posts_path, notice: @post.destroy ? '刪除成功' : '刪除失敗')
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

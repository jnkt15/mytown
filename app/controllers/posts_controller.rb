class PostsController < ApplicationController
  before_action :logged_in_user

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "登録されました！"
      redirect_to post_path(@post)
    else
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "情報が更新されました！"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.admin? || current_user?(@post.user)
      @post.destroy
      flash[:success] = "投稿が削除されました"
      redirect_to request.referrer == user_url(@post.user) ? user_url(@post.user) : root_url
    else
      flash[:danger] = "他人の投稿は削除できません"
      redirect_to root_url
    end
  end

  private

    def post_params
      params.require(:post).permit(:name, :discription, :reference, :memo, :picture)
    end
end

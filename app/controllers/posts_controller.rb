class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    # @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author_id = current_user

    if post.save
      redirect_to "/users/#{current_user.id}/posts/"
    else
      flash.now[:errors] = post.errors.full_messages
      render :new
    end
  end
end

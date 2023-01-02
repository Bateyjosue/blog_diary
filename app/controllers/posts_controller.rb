class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find_by(id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author_id = current_user.id
    post.comments_counter = 0
    post.likes_counter = 0

    if post.save
      flash[:notice] = "Post created successfully"
      redirect_to "/users/#{current_user.id}/posts/"
    else
      flash.now[:error] = post.errors.full_messages
      render :new
    end
  end
end

class LikesController < ApplicationController
  def create
    author = current_user
    @post_id = params[:post_id]
    @like = Like.new(author:, post_id: @post_id)

    if @like.save
      flash[:success] = 'You liked this post!'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'Not able to like this post.'
    end
  end
end

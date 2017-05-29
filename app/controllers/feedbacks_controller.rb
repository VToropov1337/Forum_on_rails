class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post.user_id = current_user.id
    @feedback = @post.feedbacks.create(params[:feedback].permit(:answer))
    @feedback.user_id = current_user.id
    @feedback.post_id = @post.id
      if @feedback.save
        redirect_to post_path(@post)
      else
        render 'new'

      end
  end
end

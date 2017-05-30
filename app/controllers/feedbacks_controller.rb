class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post.user_id = current_user.id
    @feedback = @post.feedbacks.create(params[:feedback].permit(:answer))
    @feedback.user_id = current_user.id if current_user
    @feedback.post_id = @post.id
      if @feedback.save
        redirect_to post_path(@post)
      else
        render 'new'
      end
  end
  def edit
    @post = Post.find(params[:post_id])
    @feedback = @post.feedbacks.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @feedback = @post.feedbacks.find(params[:id])
    if @feedback.update(params[:feedback].permit(:answer))
      redirect_to post_path(@post)
    else
      render 'edit'

    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @feedback = @post.feedbacks.find(params[:id])
    @feedback.destroy
    redirect_to post_path(@post)
  end
end

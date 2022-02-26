class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
    binding.pry
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(diary_id: params[:diary_id])
  end
end

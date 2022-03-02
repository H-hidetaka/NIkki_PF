class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    # respond_to do |format|
    #   format.html { redirect_to @user }
    #   format.js
    # end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    # respond_to do |format|
    #   format.html { redirect_to @user }
    #   format.js
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(diary_id: params[:diary_id])
  end
end

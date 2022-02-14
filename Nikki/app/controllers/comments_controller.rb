class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to diaries_path(comment.diary), success: t('defaults.message.created', item: Comment.model_name.human)
    else
      redirect_to diaries_path(comment.diary), danger: t('defaults.message.not_created', item: Comment.model_name.human)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(diary_id: params[:diary_id])
  end
end

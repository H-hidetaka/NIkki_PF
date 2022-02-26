class DiariesController < ApplicationController
  def index
    @diaries = Diary.all.includes(:user).order(created_at: :desc)
  end

  def new
      @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to  new_diary_path, success: t('defaults.message.created', item: Diary.model_name.human)
    else
      redirect_to  new_diary_path, danger: t('defaults.message.not_created', item: Diary.model_name.human)
    end
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @diary = current_user.diaries.find(params[:id])
  end

  def update
    @diary = current_user.diaries.find(params[:id])
    if @diary.update(diary_params)
      redirect_to @diary, success: t('defaults.message.updated', item: Diary.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Diary.model_name.human)
      render :edit
    end
  end

  def destroy
    @diary = current_user.diaries.find(params[:id])
    @diary.destroy!
    redirect_to diaries_path, success: t('defaults.message.deleted', item: Diary.model_name.human)
  end

  def bookmarks
    @bookmark_diaries = current_user.bookmark_diaries.includes(:user).order(created_at: :desc)
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body, :diary_image, :diary_image_cache, :comments)
  end
end

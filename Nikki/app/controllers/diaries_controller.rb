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
      # flash.now[danger] = t('defaults.message.not_created',item: Diary.model_name.human)
      # render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body)
  end
end

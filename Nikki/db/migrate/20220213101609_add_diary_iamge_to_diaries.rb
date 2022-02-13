class AddDiaryIamgeToDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :diaries, :diary_image, :string
  end
end

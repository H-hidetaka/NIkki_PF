class Diary < ApplicationRecord
  mount_uploader :diary_image, DiaryImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 60_000 }

end

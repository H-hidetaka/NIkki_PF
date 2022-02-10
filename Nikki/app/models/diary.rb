class Diary < ApplicationRecord
  belongs_to :user

  has_many :diaries, dependent: :destroy
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 60_000 }

end

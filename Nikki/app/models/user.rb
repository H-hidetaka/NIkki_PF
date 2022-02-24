class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :diaries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_diaries, through: :bookmarks, source: :diary

  validates :password, length: { minimum: 6, maximum: 20 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 16 }

  def own?(object)
    id == object.user_id
  end

  def bookmark(diary)
    bookmark_diaries << diary
  end

  def unbookmark(diary)
    bookmark_diaries.destroy(diary)
  end

  def bookmark?(diary)
    bookmark_diaries.include?(diary)
  end
end

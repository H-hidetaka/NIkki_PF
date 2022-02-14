class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates :body, presence: true, length: { maximum: 60_000}
end

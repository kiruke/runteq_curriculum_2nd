class Board < ApplicationRecord
  belongs_to :user 
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users_who_bookmarked, through: :bookmarks, source: :user

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

  def is_mine?(current_user)
    self.user == current_user
  end
end

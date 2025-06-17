class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def bookmark_by?(current_user)
    bookmark.where(user_id: current_user.id).exitsts?
  end
end

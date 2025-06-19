class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    if bookmark.save
      redirect_to boards_path, notice: ('bookmarkしました')
    else
      redirect_back_or_to boards_path, alert: 'bookmarkに失敗しました'
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id])
    bookmark.destroy!
    redirect_to boards_path, notice: ('bookmarkを削除しました')
  end

  def index
  end

end

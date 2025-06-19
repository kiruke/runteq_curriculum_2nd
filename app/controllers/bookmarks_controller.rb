class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    if bookmark.save
      redirect_to boards_path, success: ('ブックマークしました')
    else
      redirect_back_or_to boards_path, alert: 'ブックマークに失敗しました'
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id])
    bookmark.destroy!
    redirect_to boards_path, success: ('ブックマークを外しました')
  end

  def index
    #@bookmarks = current_user.bookmarks N+1問題発生
    #@bookmarks = current_user.bookmarks.includes(:board)
    @bookmarks = current_user.bookmarks.includes(board: :user)
  end

end

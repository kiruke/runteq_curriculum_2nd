class BookmarksController < ApplicationController
  def create
    # bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    # if bookmark.save
    #   redirect_to boards_path, success: t('defaults.message.bookmarked', item: Bookmark.model_name.human)
    # end
    board = Board.find(params[:board_id])
    current_user.bookmark(board)
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmarked')
  end

  def destroy
    # bookmark = current_user.bookmarks.find_by(id: params[:id])
    # bookmark.destroy!
    # redirect_to boards_path, success: t('defaults.message.delete_bookmark', item: Bookmark.model_name.human)
    board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(board)
    redirect_back fallback_location: root_path, success: t('defaults.message.delete_bookmark')
  end

  def index
    #@bookmarks = current_user.bookmarks N+1問題発生
    #@bookmarks = current_user.bookmarks.includes(:board)
    @bookmarks = current_user.bookmarks.includes(board: :user)
  end
end

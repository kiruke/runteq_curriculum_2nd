class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    if bookmark.save
      redirect_to boards_path, success: t('defaults.message.bookmarked', item: Bookmark.model_name.human)
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id])
    bookmark.destroy!
    redirect_to boards_path, success: t('defaults.message.delete_bookmark', item: Bookmark.model_name.human)
  end

  def index
    #@bookmarks = current_user.bookmarks N+1問題発生
    #@bookmarks = current_user.bookmarks.includes(:board)
    @bookmarks = current_user.bookmarks.includes(board: :user)
  end

end

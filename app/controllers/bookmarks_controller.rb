class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save
    redirect_to boards_path
  end

  def destroy
  end

end

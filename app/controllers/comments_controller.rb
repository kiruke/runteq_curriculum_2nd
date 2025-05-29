class CommentsController < ApplicationController
  def create 
    board = Board.find(params[board_id])
    comment = current_user.board
  end

  def destroy
    
  end

end

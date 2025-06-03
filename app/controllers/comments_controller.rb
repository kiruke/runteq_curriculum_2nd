class CommentsController < ApplicationController
  def create 
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @board, notice: 'コメントを投稿しました'
    end
  end

  def destroy
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end

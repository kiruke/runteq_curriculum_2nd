class CommentsController < ApplicationController
  def create 
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        #redirect_to board_path(comment.board), success: t('defaults.message.created', item: Comment.model_name.human) 
        format.js
      else
        #redirect_to board_path(comment.board), danger: t('defaults.message.not_created', item: Comment.model_name.human)
        format.js
      end
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_back fallback_location: root_path, success: t('defaults.message.delete_comment')
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end

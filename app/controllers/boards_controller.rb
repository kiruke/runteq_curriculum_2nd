class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    #@boards = Board.all N+1発生
    @boards = Board.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    #@board = Board.new(board_params) 関連付けがある場合はbuild
    #@board.user = current_user
    @board = current_user.boards.build(board_params)
    if @board.save
      #redirect_back_or_to(boards_path, success: t('.success') )
      redirect_to boards_path, success: t('defaults.message.created', item: Board.model_name.human)
    else
      #flash.now[:danger] = t('.failed')
      flash.now[:danger] = t('defaults.message.not_created', item: Board.model_name.human)
      render :new
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('defaults.message.deleted', item: Board.model_name.human)
  end

  def show
    #@comments = @board.comments
    #@comments = Board.includes(:comments).where(id: @board.id).order(created_at: :desc)
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :new
    end 
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :image, :image_cache)
  end

  def set_board
    @board = current_user.boards.find(params[:id])  
  end
end

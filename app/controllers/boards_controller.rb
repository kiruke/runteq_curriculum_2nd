class BoardsController < ApplicationController
  def index
    #@boards = Board.all N+1発生
    @boards = Board.includes(:user).order(create_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    #@board = Board.new(board_params) 関連付けがある場合はbuild
    #@board.user = current_user
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_back_or_to(boards_path, success: t('.success') )
    else
      flash.now[:danger] = t('.failed')
      render :new
    end
  end

  def destroy
    @board = Board.find(params[:id])
  end

  def update
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

end

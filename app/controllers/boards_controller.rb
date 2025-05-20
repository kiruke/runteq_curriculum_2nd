class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_back_or_to(board_path, success: t('.regist_successful') )
    else
      flash.now[:danger] = t('.regist_failed')
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

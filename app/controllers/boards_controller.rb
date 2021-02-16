class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

<<<<<<< HEAD
  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.all
  end

=======
  private

  def board_params
    params.require(:board).permit(:name, :description, :category, :price)
  end
>>>>>>> 7395ebdbcc6ca3ab65a8f20c43fbd5bc7c69f457
end

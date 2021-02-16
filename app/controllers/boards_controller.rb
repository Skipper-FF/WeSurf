class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    authorize @board
    
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

  def update
    @board = Board.find(params[:id])
    authorize @board
    if @board.update(board_params)
      redirect_to @board
    else
      render :edit
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :description, :category, :price)
  end
end

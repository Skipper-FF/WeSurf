class BoardsController < ApplicationController
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

  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.all
  end

end

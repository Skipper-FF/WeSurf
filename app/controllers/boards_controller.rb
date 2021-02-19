class BoardsController < ApplicationController
  def index
    if params[:search]
      if params[:search][:query].present?
        @boards = policy_scope(Board).near(params[:search][:query], 5)
      else
        @boards = policy_scope(Board)
      end
    else
      @boards = policy_scope(Board)
    end

    # the `geocoded` scope filters only boards with coordinates (latitude & longitude)
    @markers = @boards.geocoded.map do |board|
      {
        lat: board.latitude,
        lng: board.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { board: board }),
        image_url: helpers.asset_url('surfing.png')
      }
    end
  end

  def show
    @board = Board.find(params[:id])
    @booking = Booking.new
    authorize @board
    @markers = {
      lat: @board.latitude,
      lng: @board.longitude
      }
  end

  def new
    @board = Board.new
    authorize @board
  end

  def create
    @board = Board.new(board_params)
    authorize @board
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

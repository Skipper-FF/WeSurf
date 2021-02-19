class BookingsController < ApplicationController
  before_action :authenticate_user!

  # def preload
  #   board = Board.find(params[:board_id])
  #   today = Date.today
  #   bookings = board.bookings.where("start_date >= ? OR end_date >= ?", today, today)

  #   render json: bookings
  # end

  def new
    @board = Board.find(params[:board_id])
    @booking = Booking.new
  end

  def create
    @board = Board.find(params[:board_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.board = @board
    authorize @booking

    start_date = Date.parse(booking_params[:start_date])
    end_date = Date.parse(booking_params[:end_date])
    days = (end_date - start_date).to_i + 1

    @booking.price = @board.price

    if @booking.save
      flash[:alert] = "Congrats! You have booked this board"
      redirect_to dashboard_path
    else
      render "boards/show"
    end
  end

  # def index
  #   @bookings = policy_scope(Booking)
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :board_id)
  end
end

class BookingsController < ApplicationController
  before_action :authenticate_user!

  def preload
    board = Board.find(params[:board_id])
    today = Date.today
    bookings = board.bookings.where("start_date >= ? OR end_date >= ?", today, today)

    render json: bookings
  end

  def create
    @reservation = current_user.bookings.create(booking_params)

    redirect_to @reservation.board, notice: "Your booking has been created..."
  end

  private

  def reservation_params
    params.require(booking).permit(:start_date, :end_date, :price, :total, :board_id)
  end
end

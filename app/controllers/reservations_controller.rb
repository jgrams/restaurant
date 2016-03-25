class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
    @restaurant_options = Rest.all.map {|restaurant| [restaurant.name, restaurant.id] }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to '/reservations'
    else 
      redirect_to :root
    end
  end

  def index
  @user_reservations = Reservation.all.select do |reservation|
    if reservation.user_id = current_user.id
      reservation
    end
    end
  end

  def reservation_params
    params.require(:reservation).permit(:time, :name, :rest_id, :user_id)
  end

end

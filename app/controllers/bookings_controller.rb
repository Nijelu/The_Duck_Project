class BookingsController < ApplicationController
  # use 'authorize @booking' in methods
  before_action :set_params, only: [:show, :update]

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    @duck = Duck.find(params[:duck_id])
    authorize @booking

    @disabledates = @duck.bookings.all.map { |booking| [booking.start_date, booking.end_date] }
  end

  def create
    dates = params[:dates].split(' to ')
    
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new(start_date: dates[0], end_date: dates[1])
    @booking.user = current_user
    @booking.status = "pending"
    @booking.duck = @duck
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @duck = Duck.find(params[:duck_id])
    authorize @booking
    if @booking.update(booking_update_params)
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def set_params
    @booking = Booking.find(params[:id])
  end

  def booking_update_params
    params.require(:booking).permit(:tenant_review, :owner_review, :status)
  end
end

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
  end

  def create
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new(booking_create_params)
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

  def booking_create_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def booking_update_params
    params.require(:booking).permit(:tenant_review, :owner_review, :status)
  end
end

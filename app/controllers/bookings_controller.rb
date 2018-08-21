class BookingsController < ApplicationController
  # use 'authorize @booking' in methods

  def show
    authorize @booking
  end

  def new
    authorize @booking
  end

  def create
    authorize @booking
  end
end

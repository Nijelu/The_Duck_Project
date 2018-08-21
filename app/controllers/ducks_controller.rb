class DucksController < ApplicationController
  # use 'authorize @duck' in methods
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @duck = policy_scope(Duck)
  end

  def show
    @duck = Duck.find(params[:id])
    authorize @duck
  end

  def new
    @duck = Duck.new
    @duck.user = current_user
    authorize @duck
  end

  def create
    authorize @duck
  end

  def edit
    authorize @duck
  end

  def update
    authorize @duck
  end

  def destroy
    authorize @duck
  end

  private

  def duck_params
    params.require(:duck).permit(:title, :description, :price_per_day, :address, :country, :city, :postal_code)
  end
end

class DucksController < ApplicationController
  # use 'authorize @duck' in methods
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
    @duck = policy_scope(Duck)
  end

  def show
    authorize @duck
  end

  def new
    @duck = Duck.new
    @duck.user = current_user
    authorize @duck
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user = current_user
    authorize @duck
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
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

  def set_params
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:title, :description, :price_per_day, :address, :city,:country, :postal_code, :photo)
  end
end

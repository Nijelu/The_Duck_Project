class DucksController < ApplicationController
  # use 'authorize @duck' in methods
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
    @ducks = policy_scope(Duck)
  end

  def show
    authorize @duck
    @markers = [{
        lat: @duck.latitude,
        lng: @duck.longitude
        # infoWindow: { content: render_to_string(partial: "/ducks/map_box", locals: { duck: duck }) }
      }]
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
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  def destroy
    authorize @duck
    @duck.destroy

    redirect_to dashboard_path
  end

  private

  def set_params
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:title, :description, :price_per_day, :address, :photo, :latitude, :longitude)
  end
end

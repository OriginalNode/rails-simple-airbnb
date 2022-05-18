class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def new
    @flat = Flat.new
  end

  def index
    @flats = Flat.all
  end

  def show
    @token = 'pk.eyJ1IjoiYWx4MTEwNyIsImEiOiJjbDJ1OGNiejUwYnJkM3NvNHV5YmJvZnIzIn0.57cUtXHIjKkas4VUYuoD2Q'
    @url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{@flat.address}.json?access_token=#{@token}"
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end

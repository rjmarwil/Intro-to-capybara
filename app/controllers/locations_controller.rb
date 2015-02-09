class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to locations_path, :notice => "Location was successfully created."
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    redirect_to location_path(@location), :notice => "Location was successfully updated."
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to location_path, :notice => "Location was successfully destroyed."
  end

  def locations_params
    params.require(:locations).permit(:name, :address, :zipcode)
  end

end

class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :edit, :update]

  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.valid?
      @city.save
      flash[:notice] = "Your city was successfully created."
      redirect_to @city
    else
      flash[:errors] = @city.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @city.update(city_params)
    if @city.valid?
      flash[:notice] = "Your city was successfully updated."
      redirect_to @city
    else
      flash[:errors] = @city.errors.full_messages
      render :edit
    end
  end

  def delete
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :state)
  end

end

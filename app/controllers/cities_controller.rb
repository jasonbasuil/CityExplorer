class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.valid?
      @city.save
      redirect_to @city
    else
      render :new
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    byebug
    @city = City.update(city_params)
    if @city.valid?
      flash[:notice] = "Your city was successfully updated."
      redirect_to @city
    else
      render :edit
    end
  end

  def delete
  end

  private

  def city_params
    params.require(:city).permit(:name, :state)
  end

end

class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :delete]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      flash[:notice] = "Your event was successfully created."
      redirect_to @event
    else
      flash[:errors] = @event.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @event = Event.update(event_params)
    if @event.valid?
      flash[:notice] = "Your event was successfully updated."
      redirect_to @event
    else
      flash[:errors] = @event.errors.full_messages
      render :edit
    end
  end

  def delete
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :time, :description, :address, :city_id)
  end

end

class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :delete]

  def index
    @events = Event.all.select do |event|
      event.city_id == @current_user.city_id
    end
  end


  def show
    @rsvp = Rsvp.new
  end

  def new
    if logged_in?
      @event = Event.new
    else
      flash[:message] = "Please log in to create an event."
      redirect_to login_path
    end
  end

  def create
    #@host = User.find_by(params[:host_id])
    @event = Event.create(event_params)
    @host = User.find_by(id: params[:event][:host_id])
    @greeting = "HELLOO!!"
    if @event.valid?
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
    @event.update(event_params)
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
    params.require(:event).permit(:name, :date, :time, :description, :address, :city_id, :host_id)
  end

end

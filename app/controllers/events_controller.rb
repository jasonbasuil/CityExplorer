class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    if city_events == []
      @message = "There are currently no events in this city."
    else
      @events = city_events
    end
    @city = current_user_city
  end


  def show
    @rsvp = Rsvp.new
    @rsvps = Rsvp.all
    #byebug corresponds to lines 37-39 in show page
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
    @event = Event.create(event_params)
    @host = User.find_by(id: params[:event][:host_id])
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

  def destroy
    @event.destroy
    redirect_to @current_user
  end

  private

  def city_events
    Event.all.select do |event|
      event.city_id == @current_user.city_id
    end
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:avatar, :name, :date, :time, :description, :address, :city_id, :host_id)
  end

  # def find_attendees
  #   attendees = []
  #   Users.all.each do |user|
  #     user.id == @event.guests
  #   end
  # end

end

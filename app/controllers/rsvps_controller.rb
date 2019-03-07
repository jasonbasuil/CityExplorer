class RsvpsController < ApplicationController

  def new
  end

  def create
    Rsvp.create(rsvp_params)
    flash[:message] = "Successfully RSVP'd for this event."
    redirect_to @current_user
  end


  private

  def rsvp_params
    params.require(:rsvp).permit(:guest_id, :event_id)
  end

end

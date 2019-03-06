class ApplicationController < ActionController::Base
  helper_method :logged_in?, :find_hosted_events
  before_action :set_current_user

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!@current_user
  end

  def find_hosted_events
    Event.all.select do |event|
      if event.host_id == @current_user.id
        event
      end
    end
  end
end

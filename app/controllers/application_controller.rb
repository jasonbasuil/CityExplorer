class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user_city
  before_action :set_current_user

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!@current_user
  end

  def current_user_city
    City.all.find do |city|
      city.id == @current_user.city_id
    end
  end

end

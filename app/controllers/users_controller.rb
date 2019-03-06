class UsersController < ApplicationController
  helper_method :find_hosted_events
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    # if @current_user.id.to_i != params[:id].to_i
    #   redirect_to profile_path
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      flash[:notice] = "You have successfully updated your account."
      redirect_to '/profile'
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def delete
  end

  private

  def find_hosted_events
    Event.all.select do |event|
      if event.host_id == @current_user.id
        event
      end
    end
  end

  def set_user
    @user = User.find(@current_user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :city_id)
  end

end

class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    #@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
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
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def delete
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :bio)
  end

end

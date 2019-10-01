class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to user_path(@user)
    else
      render action: :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update(params_user)
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end
  
  def destroy
  end

  def params_user
    params.require(:user).permit(:name)
  end  
end

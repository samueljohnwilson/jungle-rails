class UserController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @user = User.find params[:id]
  end


  def category_params
    params.require(:category).permit(:name)
  end

end
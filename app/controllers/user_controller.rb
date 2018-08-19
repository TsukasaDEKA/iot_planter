class UserController < ApplicationController
  protect_from_forgery except: :create 
  def top
    @user_list = User.all
  end

  def new
  end

  def create
    @user = User.new(name: params[:name])
    @user.save
    redirect_to('/user')
  end
end

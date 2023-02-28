class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @id = params[:user_id]
  end
end

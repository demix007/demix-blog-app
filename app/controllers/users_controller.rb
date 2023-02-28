class UsersController < ApplicationController
  def index; end

  def show
    @id = params[:user_id]
  end
end

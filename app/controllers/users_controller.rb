# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def show
    @id = params[:id]
  end
end

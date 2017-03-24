class TopsController < ApplicationController
  def index
    @friends = User.where.not(id: current_user.id)
  end
end

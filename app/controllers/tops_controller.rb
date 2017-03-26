class TopsController < ApplicationController
  def index
    @friends = User.where.not(id: current_user.id)
    @users = User.where('name LIKE(?)', "%#{params[:name]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
end

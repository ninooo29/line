class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(update_params)
    redirect_to root_path
  end


  private
  def update_params
    params.require(:user).permit(:UserId, :avatar)
  end

end

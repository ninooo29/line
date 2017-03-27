class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    # binding.pry
    if params[:user_id].present?
      # user_groups = Group_user.find_by_sql('select * from users where user_id = #{current_user.id}')
      # receive_user_groups = Group_user.find_by_sql('select * from users where user_id = #{params[:user_id}')
      # if user_groups & receive_user_groups
      # if current_user.group_users.where(user_id: params[:user_id]).blank?
      groups_one = current_user.groups
      groups_two = User.find(params[:user_id]).groups
      unless (groups_one & groups_two).present?
        group = current_user.groups.create(name: "", status: :individual)
        group.group_users.create(user_id: params[:user_id])
      end
    end

    @messages = Message.where(user_id: params[:user_id],login_user_id: current_user.id )
    @partner = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    Message.create(messages_params)
    redirect_to user_messages_path
  end

  private
  def messages_params
    params.require(:message).permit(:body, :image).merge(login_user_id: current_user.id, user_id: params[:user_id])
  end

end

class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    groups_one = current_user.groups
    groups_two = User.find(params[:user_id]).groups
    unless (groups_one & groups_two).present?
      group = current_user.groups.create(name: "", status: :individual)
      group.group_users.create(user_id: params[:user_id])
      @group = group.id
    else
      @group = (groups_one & groups_two).first.id
    end
    @messages = Message.where(user_id: params[:user_id],login_user_id: current_user.id )
    @partner = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    Message.create(messages_params)
    redirect_to new_user_message_path
  end

  private
  def messages_params
    params.require(:message).permit(:body, :image, :group_id).merge(login_user_id: current_user.id, user_id: params[:user_id])
  end

end

class MessagesController < ApplicationController

  def index
    @messages = Message.where(user_id: params[:user_id] ,login_user_id: current_user.id )
    @partner= User.find(params[:user_id])
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

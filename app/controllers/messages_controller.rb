class MessagesController < ApplicationController

  def index
    @messages = Message.where(user_id: params[:user_id])
    @message = Message.new
  end

  def create
    Message.create(messages_params)
  end

  private
  def messages_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

end

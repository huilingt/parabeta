class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

  def create
    # @channel = Channel.find_by_name("Community")

    @channel = Channel.find(params[:channel_id])
    @message = Message.new(message_params)
    @message.channel = @channel
    @message.user = current_user
    @messages = Message.all
    @users = User.all
    @user = @users.find_by(params[:user_id])
    @reviews = Review.all
    @avatar = current_user



    if @message.save
      CommunityChannel.broadcast_to(
        @channel,
        render_to_string(partial: "channels/message", locals: { message: @message })
      )
      head :ok

    else
      render "channels/community"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

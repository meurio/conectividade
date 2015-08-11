class MessagesController < ApplicationController
  def index
    @user = User.new
    @message = Message.new
    @message.build_user
  end

  def create
    user_params = message_params[:user_attributes]
    user = User.create_with(user_params).find_or_create_by(email: user_params[:email])

    # if no message was sent today by the user
    if Message.where(user: user).where('created_at >= ?', Date.today).empty?
      Message.create(user: user)
      redirect_to root_path(anchor: 'compartilhe')
    else
      redirect_to root_path(anchor: 'email-ja-enviado')
    end
  end

  def soon
    render layout: 'static'
  end

  def close_window
    render layout: 'static'
  end

  private
  def message_params
    params.fetch(:message, {}).permit(user_attributes: [:first_name, :last_name, :email])
  end
end

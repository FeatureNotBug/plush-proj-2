class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

  def send_message
    @user = User.find(params[:user_id])
    @message = params[:message]
    @subject = params[:subject]
    current_user.send_message(@user, "#{@message}", "#{@subject}")
    redirect_to root_path
  end
end

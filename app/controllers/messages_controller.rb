class MessagesController < ApplicationController
  def index
    @messages = Message.all    
  end

  def create
    @message = Message.create!(params[:message])
    broadcast("/messages/new", @message)
    render :json => @message
  end
end
class MessagesController < ApplicationController
  def index
    @messages = Message.all    
  end

  def create
    @message = Message.create!(params[:message])
    
    #Pusher['private-'+current_user.id.to_s].trigger('new_message', {:from => current_user.name, :subject => @message.content})
    Pusher['public'].trigger('new_message', {:from => current_user.name, :subject => @message.content})
    puts '****************** Sending message: ' + @message.content

  end

end
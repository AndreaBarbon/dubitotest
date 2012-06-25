class MessagesController < ApplicationController
  def index
    @messages = Message.all(:limit => 15, :order => "updated_at DESC")   
  end

  def create
    @message = Message.create!(params[:message])
    @room_id = @message.room_id ? @message.room_id : 'public'
    
    #Pusher['private-'+current_user.id.to_s].trigger('new_message', {:from => current_user.name, :subject => @message.content})
    Pusher['room-'+@room_id.to_s].trigger('new_message', {:from => current_user.name, :subject => @message.content})
    puts '****************** Sending message: ' + @message.content + ' to  channel: ' + 'room-'+@room_id.to_s

  end

end
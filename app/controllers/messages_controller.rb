class MessagesController < ApplicationController
  def index
    @messages = Message.all    
  end

  def create
    @message = Message.create!(params[:message])
    
    #Pusher['private-'+current_user.id.to_s].trigger('new_message', {:from => current_user.name, :subject => @message.content})
    Pusher['public'].trigger('new_message', {:from => current_user.name, :subject => @message.content})
    
    #broadcast("/messages/new", @message)
    #render :json => @message
  end

  private

  def broadcast(channel, object)    
    message = {:channel => channel, :data => { :message => object, :type => "message" }, :ext => {:auth_token => FAYE_TOKEN} }    
    uri = URI.parse('http://localhost:9292/faye')
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
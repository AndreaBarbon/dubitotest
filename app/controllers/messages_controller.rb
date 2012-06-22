class MessagesController < ApplicationController
  def index
    @messages = Message.all    
  end

  def create
    @message = Message.create!(params[:message])
    broadcast("/messages/new", @message)
    render :json => @message
  end

  private
  
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://dubitoserver.herokuapp.com/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
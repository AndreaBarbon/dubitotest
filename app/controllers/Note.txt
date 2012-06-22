#controller
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

  def broadcast(channel, object)
    message = {:channel => channel, :data => { :object => object, :type => "message" } }
    uri = URI.parse("http://dubitoserver.herokuapp.com/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end




#server.js
$(function() {
	var faye = new Faye.Client('http://dubitoserver.herokuapp.com/faye');
  faye.subscribe('/messages/new', function (data) {
    console.log(data);
    $("#chat").append('<li>' + data.object.body + '</li>')
  });

  $("#new_message").live("ajax:complete", function(event,xhr,status){
    $('#new_message')[0].reset();
  });
});
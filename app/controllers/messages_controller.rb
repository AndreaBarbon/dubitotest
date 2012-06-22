class MessagesController < ApplicationController
  def index
    @messages = Message.all    
  end

  def create
    @message = Message.create!(params[:message])
    broadcast "/messages/new" do
      $("#chat").append("<%= j render(@message) %>");
    end
  end
end
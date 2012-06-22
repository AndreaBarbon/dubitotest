
class IphoneController < ApplicationController
  def listen
  end
  def new_message
    @message = Message.create(:content => params[:content]) 
  end
end

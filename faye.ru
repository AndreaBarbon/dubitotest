require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'

require File.expand_path('../config/initializers/faye_token.rb', __FILE__)

load 'faye/client_event.rb'


faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)


faye_server.add_extension(ClientEvent.new)


Faye::WebSocket.load_adapter('thin')

faye_server.bind(:disconnect) do |client_id|
  puts "--------------------------------------------------------------------------> Client #{client_id} disconnected"
end


run faye_server

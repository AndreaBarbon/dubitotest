class ClientEvent
  MONITORED_CHANNELS = [ '/meta/subscribe', '/meta/disconnect' ]

  def incoming(message, callback)
    return callback.call(message) unless MONITORED_CHANNELS.include? message['channel']

    faye_msg = Hashie::Mash.new(message)
    faye_action = faye_msg.channel.split('/').last

    faye_client.publish('/messages/new', build_hash(faye_action))
    callback.call(message)
  end


  def build_hash(action)
    message_hash = {}

    if action == 'subscribe'
      message_hash['message'] = { 'content' => "A user has entered."}
    elsif action == 'disconnect'
      message_hash['message'] = { 'content' => "A user has left." }
    end

    message_hash
  end
  
  
  def faye_client
    @faye_client ||= Faye::Client.new('http://dubitoserver.herokuapp.com/faye')
  end
  
end
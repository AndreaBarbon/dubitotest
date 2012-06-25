# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


Pusher.channel_auth_endpoint = '/pusher/auth'
pusher = new Pusher('6d703ea627122d6087a6')
presenceChannel = pusher.subscribe('presence-'+room_id)
channel_room = pusher.subscribe 'room-'+room_id
console.log 'Room: ' + 'room-' + room_id

		
channel_room.bind 'new_message', (data) ->
	console.log 'Public message received'
	msg = data.from + ': ' + data.subject
	dom_notify msg	


pusher.connection.bind 'connecting', ->
	$('div#status').text 'Connecting to Pusher...'

pusher.connection.bind 'connected', ->
	$('div#status').text 'Connected to Pusher!'

pusher.connection.bind 'state_change', (states) ->
	console.log 'State changed to '+states.current
	$('div#status').text "Pusher's current state is " + states.current

pusher.connection.bind 'failed', ->
	$('div#status').text 'Connection to Pusher failed :('

channel_room.bind 'subscription_error', (status) ->
	$('div#status').text 'Pusher subscription_error'


# Members tracking

presenceChannel.bind 'pusher:subscription_succeeded', (members) ->
	console.log 'subscription_succeeded, members: ' + members.count
	dom_notify 'We are ' + members.count + ' now'
	$('h3').text members.count+' people'
	

presenceChannel.bind "pusher:member_added", (member) ->
	console.log 'Member added'
	dom_notify  member.info.name+' joined us'
	
presenceChannel.bind 'pusher:member_removed', (member) ->
	console.log 'Member removed'
	dom_notify  member.info.name+' left us'
	


pusher.connection.bind "connected", ->
  console.log 'Connected to Pusher!'
	
$ ->
  $("#new_message").live "ajax:complete", (event, xhr, status) ->
    $("#new_message")[0].reset()

dom_notify = (msg) ->
	msg = '<li>'+msg+'</li>'
	$("#notify").append msg
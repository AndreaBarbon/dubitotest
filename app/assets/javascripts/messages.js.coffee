# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


Pusher.channel_auth_endpoint = '/pusher/auth'
pusher = new Pusher('e50277c2ad2071c2e622')
presenceChannel = pusher.subscribe('presence-test')
	
presenceChannel.bind 'pusher:subscription_succeeded', (members) ->
	console.log 'subscription_succeeded, members: ' + members.count
	dom_notify 'Now we are' + members.count

presenceChannel.bind "pusher:member_added", (member) ->
	console.log 'Member added'
	dom_notify 'Member added'
	
presenceChannel.bind 'pusher:member_removed', (member) ->
	console.log 'Member removed'
	dom_notify 'Member removed'
	
		
pusher.connection.bind "connected", ->
  console.log 'Connected to Pusher!'
	
$ ->
  $("#new_message").live "ajax:complete", (event, xhr, status) ->
    $("#new_message")[0].reset()



presenceChannel.bind "pusher:member_removed", (member) ->
	console.log('Member removed')
	msg = '<br/>Member removed'
	dom_notify(msg)

dom_notify = (msg) ->
  $("#notify").append msg

dom_notify('Im alive &<br/>')
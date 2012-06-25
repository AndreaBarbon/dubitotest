# Dubito Test
## A online game test, using Pusher and websockets

## Set up

First set your local pg credentials in config/database.yml. 
The in the terminal

    $ bundle
    $ bundle update
    $ rake db:migrate
    $ rails s

## Have a look to the following files:

### messages.js.coffee
Most of the Pusher stuffs are here

###	messages_controller.rb
Here you find the action called when a user sends a message. It is delivered through pusher

### pusher_controller.rb
Deals with Pusher authorization

### application.html.erb
Application view layout. Here we also set the room_id variable


## Links

 * [www.fractalsoft.it](http://www.fractalsoft.it), fractalsoft website


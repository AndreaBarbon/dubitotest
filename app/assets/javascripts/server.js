$(function() {
	var faye = new Faye.Client('http://dubitoserver.herokuapp.com/faye');
  faye.subscribe('/messages/new', function (data) {
    console.log(data);
    $("#chat").append('<li>' 'Ciao' '</li>')
  });

  $("#new_message").live("ajax:complete", function(event,xhr,status){
    $('#new_message')[0].reset();
  });
});
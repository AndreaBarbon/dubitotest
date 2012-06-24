$(function() {
	var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/messages/new', function (data) {
    console.log(data);
    $("#chat").append('<li>' + data.message.content + '</li>')
  });

  $("#new_message").live("ajax:complete", function(event,xhr,status){
    $('#new_message')[0].reset();
  });
});
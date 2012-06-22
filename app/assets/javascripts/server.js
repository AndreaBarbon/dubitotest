$(function() {
  var faye = new Faye.Client('http://dubitoserver.herokuapp.com/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});
$(function() {
  var faye = new Faye.Client('http://dubitotest.herokuapp.com/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});
var blocmetrics = {};

blocmetrics.report = function(eventName){
  var event = { name: eventName };

  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');

  request.onreadystatechange = function() {

  };

  request.send(JSON.stringify(event));
}
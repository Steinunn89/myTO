window.myMap = {};
myMap.init = function() {
	var latitude = $('#map-canvas').data('latitude');
	var longitude = $('#map-canvas').data('longitude');
	var showMarker = $('#map-canvas').data('showmarker') || true;
  	var coords = $('#map-canvas').data('coords');
	
	var options = {
		zoom: 14,
		center: new google.maps.LatLng(latitude, longitude),
		mapTypeId: google.maps.MapTypeId.ROADMAP

	}
	this.canvas = new google.maps.Map($('#map-canvas')[0], options)

  if (showMarker) {
    this.addMarker(latitude, longitude);
  }

  if (coords) {
    coords.forEach(function(coord) {
      myMap.addMarker(coord.latitude, coord.longitude, "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png");
    });
  }
};

myMap.addMarker = function(latitude, longitude, image) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(latitude, longitude),
    map: this.canvas,
    icon: image
  });
}

$(document).on('ready page:load', function(){
	if ($('#map-canvas').length) {
		myMap.init();

		var coords = $('#map-canvas').data('coords');
		if(coords) {
			myMap.addMarker(coords);
		}
	}
});
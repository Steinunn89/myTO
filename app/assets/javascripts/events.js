function geolocationSuccess(position) {
	console.log(position)
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;

	$('.location-error').hide();

	$.ajax({
		url: '/events',
		method: 'GET',
		data: {
			latitude: latitude,
			longitude: longitude 
		},
		dataType: 'script'
	});
}

function geolocationError(){
	var $locationError = $('<p>Unable to find your location<p>');
	$location.addClass('location-error');
	$('#current-location').after($location-error);
}

$(document).on('ready page:load', function() {

	

  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();


    $.getScript('/events?search=' + searchValue)
  });

  // $('#search-form2').submit(function(event) {
  //   event.preventDefault();
  //   var searchValue2 = $('#search_location').val();

  //   $.getScript('/events?search=' + searchValue2)
  // });
 	
  $('#current-location').on('click', function() {
 		
 		if ('geolocation' in navigator) {
 			navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
 		} else {
 			alert ('Your browser does not support geolocation');
 		}
 	});
 	
     if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Fetching more events...");
        return $.getScript(url);
      }
    });
  }

});

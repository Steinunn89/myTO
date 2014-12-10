$(document).on('ready page:load', function() {
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

     // $.get('/products?search=' + searchValue)
     //  .done(function(data){
     //    console.log(data);
     //    $('#products').html(data);
     //  });
    $.getScript('/events?search=' + searchValue)
  });
 
// $(document).on('ready page:load', function() {
//   $('#search-form').submit(function(event) {
//     event.preventDefault();
//     var searchValue = $('#search').val();

//      $.getScript('/products?search=' + searchValue);
//   });

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

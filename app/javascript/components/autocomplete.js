function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var duckAddress = document.getElementById('duck_address');

    if (duckAddress) {
      var autocomplete = new google.maps.places.Autocomplete(duckAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(duckAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

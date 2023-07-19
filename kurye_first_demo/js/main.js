var myLatLng = { lat: 0.0, lng: 0.0 };
var mapOptions = {
    center: myLatLng,
    zoom: 1,
    mapTypeId: google.maps.MapTypeId.ROADMAP
};

// Hide result box
document.getElementById("output").style.display = "none";

// Create/Init map
var map = new google.maps.Map(document.getElementById('google-map'), mapOptions);

// Create a DirectionsService object to use the route method and get a result for our request
var directionsService = new google.maps.DirectionsService();

// Create a DirectionsRenderer object which we will use to display the route
var directionsDisplay = new google.maps.DirectionsRenderer();

// Bind the DirectionsRenderer to the map
directionsDisplay.setMap(map);


// Define calcRoute function
function calcRoute() {
    //create request
    var request = {
        origin: document.getElementById("location_1").value,
        destination: document.getElementById("location_2").value,
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC
    }

   

    // Routing
    directionsService.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            var ucret = 0;
            //Get distance and time   
            if (document.getElementById('free').checked == true) {

                ucret = parseFloat(result.routes[0].legs[0].distance.text);
                var top = ucret * 5 + 25;
            }
            else if (document.getElementById('basic').checked == true) {

                ucret = parseFloat(result.routes[0].legs[0].distance.text);
                var top = ucret * 5 + 50;
            }



            $("#output").html("<span style='margin-left:8px'>Uzaklık: " + result.routes[0].legs[0].distance.text + ".<br /></span><span style='margin-left:8px'>Ucret: " + top.toString() + " ₺<br /></span><span style='margin-left:8px'>Süre: " + result.routes[0].legs[0].duration.text + "</span>");
            document.getElementById("output").style.display = "block";

            $("#output2").html(top.toString()+"₺");
            document.getElementById("output2").style.display = "inline";

            document.getElementById("TextBox1").value = top.toString();

            //display route
            directionsDisplay.setDirections(result);
        } else {
            //delete route from map
            directionsDisplay.setDirections({ routes: [] });
            //center map in London
            map.setCenter(myLatLng);

            //Show error message           

            alert("Önce Konum Seçmeniz Gerekiyor!");
            clearRoute();
        }
    });

}

// Clear results

function clearRoute() {
    document.getElementById("output").style.display = "none";
    document.getElementById("location_1").value = "";
    document.getElementById("location_2").value = "";
    directionsDisplay.setDirections({ routes: [] });

}

// Create autocomplete objects for all inputs

var options = {
    types: ['(cities)']
}


var input1 = document.getElementById("location_1");
var autocomplete1 = new google.maps.places.SearchBox(input1, options);

var input2 = document.getElementById("location_2");
var autocomplete2 = new google.maps.places.SearchBox(input2, options);



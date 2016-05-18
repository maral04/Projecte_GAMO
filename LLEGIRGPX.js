$( document ).ready(function() {
	
	var xml = "rico.xml";
		
	//Parse the givn XML
	var xmlDoc = $.parseXML( xml ); 		
	var $xml = $(xmlDoc);
	// Find Person Tag
	var $person = $xml.find("person");
	
});

	
	
	function calculTot(){
		//Crea el marker per primer cop
		/*var marker = new google.maps.Marker({
			//position: new google.maps.LatLng( 41.7052220,2.4328690),
			map: map,
			title: 'GAMO Marker!'
		});	*/
		
		/*
		
		var xhttp;
		xhttp = new XMLHttpRequest();
		
		xhttp.open("GET", "rico.gpx", true);
		xhttp.send();
		*/

		
		//Llegeix l'XML
		// ******************
		/*doc = File.open("rico.gpx");
		detectaTRK();
		File.close();*/
	
	}
		


		
		
		
		
	detectaTRK = function() {
		var tracks = doc.documentElement.getElementsByTagName("trk");
		for(var i = 0; i < tracks.length; i++) {
			detectaTRKSEG(tracks[i]);
		}
	}
	
	detectaTRKSEG = function(track) {
		var segments = track.getElementsByTagName("trkseg");
		for(var i = 0; i < segments.length; i++) {
			var segmentlatlngbounds = detectaTRKPT(segments[i]);
		}
	}
	
	detectaTRKPT = function(trackSegment) {
		var trackpoints = trackSegment.getElementsByTagName("trkpt");
		console.log(trackpoints);
		if(trackpoints.length == 0) {			
			return;
		}else{
			console.log();
		}
	}
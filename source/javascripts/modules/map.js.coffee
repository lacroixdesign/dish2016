mapStyles = [
  # Highway
  #
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#c6d6dc" }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#96b3c0" }
    ]
  },
  # Arterial
  #
  {
    "featureType": "road.arterial",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#dec5c5" }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#c39797" }
    ]
  },
  # Local
  #
  {
    "featureType": "road.local",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#dddddd" }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#cccccc" }
    ]
  },
  # Road Labels
  #
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#203e4b" }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#4a1c1c" }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#222222" }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.stroke",
    "stylers": [
      { "color": "#f8f8f8" }
    ]
  },
  # Landscape
  #
  {
    "featureType": "landscape",
    "stylers": [
      { "color": "#f3f3f3" }
    ]
  }
]



class GoogleMap

  constructor: (@google, @coordinates, @mapStyles)->
    # Create LatLng object from coords
    @location = @latLng( coordinates.lat, coordinates.lng )
    # Create Map object
    map = @createMap()
    # Create Marker object & add to map
    marker = @createMarker(@location)
    marker.setMap( map )
    # Create InfoWindow & add to map
    infoContent = "<h5>O'More College of Design</h5>423 S Margin St, Franklin, TN 37064"
    infoWindow = @createInfoWindow(marker, infoContent)
    infoWindow.open(map, marker)


  latLng: (lat, lng)=>
    new @google.maps.LatLng(lat, lng)


  options: =>
    center: @location
    zoom: 15
    mapTypeId: @google.maps.MapTypeId.ROADMAP
    styles: @mapStyles
    streetViewControl: false
    mapTypeControl: false
    panControl: false
    zoomControlOptions:
      style: "SMALL"
    scrollwheel: false


  createMap: =>
    new @google.maps.Map( document.getElementById('map-canvas'), @options() )


  createMarker: (location)=>
    new @google.maps.Marker
      position: location
      animation: @google.maps.Animation.DROP


  createInfoWindow: (marker, content)=>
    new @google.maps.InfoWindow
      content: content




jQuery ->

  coordinates =
    lat: 35.920129
    lng: -86.868342
  map = new GoogleMap( google, coordinates, mapStyles )

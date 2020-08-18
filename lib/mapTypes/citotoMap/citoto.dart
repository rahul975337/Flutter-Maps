import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// // onMapCreated: method that is called on map creation and takes a MapController as a parameter.
// // initialCameraPosition: required parameter that sets the starting camera position. Camera position describes which part of the world you want the map to point at.
// // mapController: manages camera function (position, animation, zoom).
class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _bairagarh = const LatLng(23.271620, 77.340233);
  static const LatLng _lalghati = const LatLng(23.276871, 77.365280);
  static const LatLng _newMarket = const LatLng(23.235636, 77.400620);
  static const LatLng _vanVihar = const LatLng(23.218920, 77.372902);

  Marker marker;

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('Bairagarh'),
      position: _bairagarh,
      infoWindow: InfoWindow(title: 'Gourav'),
      icon: BitmapDescriptor.fromAsset("assets/myPic.png"),
    ),
    Marker(
      markerId: MarkerId('Lalghati'),
      position: _lalghati,
      infoWindow: InfoWindow(title: 'Rahul'),
      // icon: BitmapDescriptor.fromAsset("assets/circle_cropped.png"),
      icon: BitmapDescriptor.fromAsset("assets/myPic.png"),
    ),
    Marker(
      markerId: MarkerId('New Market'),
      position: _newMarket,
      infoWindow: InfoWindow(title: 'Shantanu'),
        icon: BitmapDescriptor.fromAsset("assets/myPic.png"),
    ),
    Marker(
      markerId: MarkerId('Van Vihar'),
      position: _vanVihar,
      infoWindow: InfoWindow(title: 'James'),
     icon: BitmapDescriptor.fromAsset("assets/myPic.png"),
    ),
  };
  LatLng _lastMapPosition = _lalghati;
  MapType _currentMapType = MapType.normal;
  BitmapDescriptor pinLocationIcon;

  @override
  void initState() {
    super.initState();
    // setCustomMapPin();
    // getCurrentPosition();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(_lalghati.latitude, _lalghati.longitude),
                  zoom: 11.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                mapToolbarEnabled: true,
                onCameraMove: _onCameraMove,
                myLocationEnabled: true,
                // myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                tiltGesturesEnabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

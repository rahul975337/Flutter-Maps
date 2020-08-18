import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MoveFromOneToOther extends StatefulWidget {
  @override
  _MoveFromOneToOtherState createState() => _MoveFromOneToOtherState();
}

class _MoveFromOneToOtherState extends State<MoveFromOneToOther> {
  static const LatLng _lalghati = const LatLng(23.276871, 77.365280);
  static const LatLng _newMarket = const LatLng(23.235636, 77.400620);
  List<Marker> allMarkers = [];

  GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    allMarkers.add(
      Marker(
          markerId: MarkerId('myMarker'),
          draggable: true,
          
          onTap: () {
            print('Marker Tapped');
          },
          position: _lalghati),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _lalghati, zoom: 12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
            onTap: movetoNewMarket,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green),
              child: Icon(Icons.forward, color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: movetoLalghati,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: Colors.red),
              child: Icon(Icons.backspace, color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoNewMarket() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: _newMarket, zoom: 14.0, bearing: 45.0, tilt: 45.0),
    ));
  }

  movetoLalghati() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: _lalghati, zoom: 12.0),
    ));
  }
}

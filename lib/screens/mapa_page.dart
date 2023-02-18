import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrreader/%20models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    final CameraPosition kGooglePlex =
        CameraPosition(target: scan.getLatLng(), zoom: 17, tilt: 50);
    MapType mapType = MapType.normal;
    //Marcadores
    Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(
          markerId: const MarkerId('geo-location'), position: scan.getLatLng()),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: scan.getLatLng(), zoom: 17, tilt: 50)));
              },
              icon: const Icon(Icons.location_disabled_rounded))
        ],
      ),
      body: GoogleMap(
        markers: markers,
        mapType: mapType,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType == MapType.normal;
          }
          setState(() {});
        },
        child: const Icon(Icons.layers),
      ),
    );
  }
}

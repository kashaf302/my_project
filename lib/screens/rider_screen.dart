import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/directions.dart' as d;
import 'package:google_maps_webservice/places.dart';
//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'alert_dialog_logout.dart';

class RiderScreen extends StatefulWidget {
  const RiderScreen({Key? key}) : super(key: key);

  @override
  State<RiderScreen> createState() => _RiderScreenState();
}

class _RiderScreenState extends State<RiderScreen> {
  
  String googleApiKey="AIzaSyCzXOncyzSXGdfqGFSjAfOOzvAT58RXFvs";
  String location="Search Location";
  Completer<GoogleMapController> _controller=Completer();
   GoogleMapController? controller;

   //polylines
   PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
//markers
  Set<Marker> markers=Set<Marker>();
  List<Marker> _marker= [];

  static final CameraPosition _kGooglePlex=const CameraPosition(target: LatLng(37.819722,-122.478611), 
  zoom: 15) ;
   

addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

 // late Position currentPosition=Geolocator.getCurrentPosition() as Position;

 loadData()async{
  getUserCurrentLocation().then((value)async {
    print("My Current Location");
    print(value.latitude.toString()+ " "+ value.longitude.toString());
    _marker.add(
      Marker( 
         markerId: MarkerId("2"),
    position: LatLng(value.latitude, value.longitude),
    infoWindow: InfoWindow(
      title: 'My current location',
    ),
    icon: BitmapDescriptor.defaultMarker
        )
    );
    
    CameraPosition cameraPosition=CameraPosition(
      target: LatLng(value.latitude, value.longitude,
      ),
      zoom: 14
      );
      final GoogleMapController controller= await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
     
  });
 
}
//get user currrent location
 Future<Position> getUserCurrentLocation() async{


  await Geolocator.requestPermission().then((value) {

  }).onError((error, stackTrace) {
    print("error"+toString());
  });
  return await Geolocator.getCurrentPosition();

}


@override
  void initState() {
    // ignore: unused_local_variable
    super.initState();
  //  _marker.addAll(_list);
  loadData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            const Text(
              'Rider Screen',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 40),
             ElevatedButton.icon(
              icon: const Icon(Icons.person,
              color: Colors.black,
              ),
              label: const Text('Logout',
              style: TextStyle(
                color: Colors.black,
              ),
              
              ),
              onPressed: () async {
                
                    await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure you want to logout?');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
          children: [
          //  SafeArea(child: 
             GoogleMap(
              initialCameraPosition: _kGooglePlex,
              markers: Set<Marker>.of(_marker),
              polylines: Set<Polyline>.of(polylines.values),
             // onLongPress: _setMarker,
             mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller) {
              
                _controller.complete(controller);
                // getUserCurrentLocation();  
              },
             
              ),
             SizedBox(height: 70),
          //search autocomplete input bar
          Positioned(
            top: 10,
            child: InkWell(
            onTap: () async{
               var place = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: googleApiKey,
                          mode: Mode.overlay,
                          types: [],
                          strictbounds: false,

                          components: [
                            Component(Component.country, 'pk'),
                            Component(Component.country, 'us'),
                            Component(Component.country, 'ind'),
                            Component(Component.country, 'ae'),
                       
                            ],
                          //google_map_webservice package
                          onError: (err){
                             print(err);
                          }
                      );
                      if(place != null){
                       /* setState(() {
                          location = place.description.toString();
                        });*/

                       //form google_maps_webservice package
                       final plist = GoogleMapsPlaces(
                        apiKey:googleApiKey,
                         apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                        );
                       
                        String placeid = place.placeId ?? "0";
                        final detail = await plist.getDetailsByPlaceId(placeid);
                        final geometry = detail.result.geometry!;
                       
                        final lat = geometry.location.lat;
                        final lang = geometry.location.lng;
                        
                      // LatLng newlatlang = LatLng(lat, lang);
                       PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
                                googleApiKey,
                                //current location
                                 PointLatLng(lat,lang),
                              // loadData(),
                                 //destination location
                                PointLatLng(lat,lang)
                              );
                        
                        if (result.points.isNotEmpty) {
                                for (var point in result.points) {
                                  polylineCoordinates.add(LatLng(point.latitude, point.longitude));
                                }
                                setState(() {
                                  addPolyLine(polylineCoordinates);
                                });
                              }

                        setState(() async{
                          LatLng? newlatlang = LatLng(lat, lang);
                          location = place.description.toString();
                          final GoogleMapController cntrlr= await _controller.future;
                 
                        cntrlr.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 19))
                        );
                       _marker.add(
                          Marker(markerId: MarkerId("Dest"),
                          position: newlatlang,
                           infoWindow: InfoWindow(
                           title: 'Destination',
                       ),
                          icon: BitmapDescriptor.defaultMarker
                          ),
                        );
                        });
                      
                        //move map camera to selected place with animation
                      /* final GoogleMapController cntrlr= await _controller.future;
                 
                        cntrlr.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 19))
                        );
                           _setMarker(newlatlang);*/
                        /* _setMarker(newlatlang);
                       final Marker marker= Marker(markerId: MarkerId("3"),position: newlatlang , icon: BitmapDescriptor.defaultMarker  );
                       setState(() {
                          _list.add(marker);
                       });*/
                       
                   }
                 },            
           child:Padding(
                   padding: EdgeInsets.all(15),
                    child: Card(
                       child: Container(
                         padding: EdgeInsets.all(0),
                         width: MediaQuery.of(context).size.width - 40,
                         child: ListTile(
                            title:Text(location, style: TextStyle(fontSize: 18),),
                            trailing: Icon(Icons.search),
                            dense: true,
                         )
                       ),
                    ),
                 )
            
            ),
            
            )
          ],
        ),
    
    );
  }
}
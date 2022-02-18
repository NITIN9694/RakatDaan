// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors, unused_element, non_constant_identifier_names, use_function_type_syntax_for_parameters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakatdaan/Widget/Bottombar.dart';
import 'package:rakatdaan/Widget/SearchTile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({ Key? key }) : super(key: key);
  static String id ="homescreen";

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

Completer<GoogleMapController> _controller = Completer();
 void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
 final Set<Marker> _markers = {};
     
static const LatLng _center =  LatLng(27.560932, 76.625015);
  @override
  Widget build(BuildContext context) {
     _markers.add(
        Marker(
            markerId : MarkerId('SomeId'),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //     builder: (context) =>

              //     // OTPScreen(mode: widget.mode,otp: data.data["otp"].toString(),
              //     //   otptoken: data.data["otptoken"],),
              //     ServiceDetailsScreen(idofservice: "1",title: "dummy data",description: "dummy data"),
              // ),
              // );
              //   Navigator.pushNamed(context, ServiceDetailsScreen.id);
            },
            position: LatLng(27.560932, 76.625015),
            infoWindow: InfoWindow(
                title: 'O+'
            )

        )
    );

    _markers.add(
        Marker(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) =>

              //   // OTPScreen(mode: widget.mode,otp: data.data["otp"].toString(),
              //   //   otptoken: data.data["otptoken"],),
              //   ServiceDetailsScreen(idofservice: "1",title: "dummy data",description: "dummy data",),
              // ),
              // );

            },
            markerId: MarkerId('SomeId'),
            position: LatLng(28.7041, 77.1025),
            infoWindow: InfoWindow(
                title: 'A+'
            )
        )
    );
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: vwhite,
        body: Stack(
          children: [
          
            GoogleMap(
              markers: _markers,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                zoom: 10,
              target: _center,
              
              
              ),
            ),
             Padding(
               padding:  EdgeInsets.all(20.0),
               child: SearchTile(),
             ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
    
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: Bottombar(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(backgroundColor: vred, child: Icon(Icons.location_on_sharp), elevation: 0.1, onPressed: () {}),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: currentIndex == 0 ?vwhite : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(0);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.restaurant_menu,
                                color: currentIndex == 1 ?vwhite : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.bookmark,
                                color: currentIndex == 2 ?vwhite : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(2);
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: currentIndex == 3 ?vwhite : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
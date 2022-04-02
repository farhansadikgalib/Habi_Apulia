import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:habi_pulia/HomeScreen/HomePage.dart';
import 'package:location/location.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
   late LocationData _locationData;


  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    permissionController();
    location.enableBackgroundMode(enable: true);


    Timer(
        Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(url: 'https://habiapulia.com')),
                (route) => false));

  }

  Future<void> permissionController()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        location.enableBackgroundMode(enable: true);
        return;
      }
    }


    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
      }
      return null;
    }

    _locationData = await location.getLocation();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/habi.png",height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.width/4,),
            Spacer(),
            SpinKitFadingCube(
              color: Colors.green,size: 25,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:maps/mapTypes/customIconMap/customIconMap.dart';
import 'package:maps/mapTypes/moveFromOneToOther/moveFromOneToOther.dart';
import 'package:maps/mapTypes/searchAddressOnMaps/searchAddressesOnMaps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SearchAddress(),
      home: SearchAddress(),
    );
  }
}
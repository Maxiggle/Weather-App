import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/loadingscreens.dart';
//import 'package:flutter_application_2/services/select_location.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    color: Colors.white,
    home: LoadingScreen(),
    );
  }
}
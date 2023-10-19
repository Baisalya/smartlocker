import 'package:flutter/material.dart';
import 'package:smartlocker/screenone.dart';

import 'CustomeAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAppBarDemo(),
    );
  }
}

class CustomAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use the custom AppBar
      body:MyWidget(),
     /* Center(
        child: Text("Your App Content Goes Here"),
      ),*/
    );
  }
}



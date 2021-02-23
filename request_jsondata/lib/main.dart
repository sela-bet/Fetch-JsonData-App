import 'package:flutter/material.dart';
import 'screens/homepage.dart';

void main() {
  runApp(MaterialApp(
    home: FetchDataApp(),
  ));
}

class FetchDataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Using Json Data"),
        ),
      ),
      body: HomePage(),
    );
  }
}

import 'package:bukata/home.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Home': (context) => HomePage(),
      },
    );
  }
}
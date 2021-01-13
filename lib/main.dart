import 'package:flutter/material.dart';

import 'package:signin_flutter_ui/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}

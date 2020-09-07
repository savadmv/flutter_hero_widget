import 'package:flutter/material.dart';

import 'listing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // This widget is the root of your application.
  static const int _customPrimarySwatch = 0xFF162447;
  static const MaterialColor primarySwatch = MaterialColor(
    _customPrimarySwatch,
    <int, Color>{
      50: Color(0xFF162442),
      100: Color(0xFF162443),
      200: Color(0xFF162444),
      300: Color(0xFF162445),
      400: Color(0xFF162446),
      500: Color(_customPrimarySwatch),
      600: Color(0xFF162451),
      700: Color(0xFF162452),
      800: Color(0xFF162453),
      900: Color(0xFF162454),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primarySwatch,
        secondaryHeaderColor: new Color(0xFF1f4068),
        accentColor: new Color(0xFF162454),
        buttonColor: new Color(0xFF1b1b2f),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListingPage(),
    );
  }
}

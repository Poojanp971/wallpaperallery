import 'package:flutter/material.dart';
import 'package:wallpaperallery/wallpapers.dart';

import 'FullImage.dart';

void main() => runApp(MyApp(
));


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wallpapers(),
      routes: {
        'FullImage': (context)=>FullImage()
      },
    );
  }
}
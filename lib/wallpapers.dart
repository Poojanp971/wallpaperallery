import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Global.dart';
import 'models/photos.dart';

class Wallpapers extends StatefulWidget{
  @override
  _WallpapersState createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {

  getWallpapers() {
    http.get("https://api.pexels.com/v1/curated",headers: {"Authorization":"563492ad6f91700001000001cce6a287365e44cbb0a1a17d27f6abb7"}).then((res){
      print(res.body);

      var parsedJson = jsonDecode(res.body);

      Global.photos = (parsedJson["photos"] as List).map((data)=>Photos.fromJson(data)).toList();
    });
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWallpapers();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GridView.builder(
          itemCount:Global.photos.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.7
          ),
          itemBuilder: (context,index){
            return GestureDetector(
                onTap: (){
                  Global.Index=index;
                  Navigator.of(context).pushNamed('FullImage');
                },child:Container(decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(image: NetworkImage(Global.photos[index].src.tiny),fit: BoxFit.cover)
            ),));
          }),
    );
  }
}
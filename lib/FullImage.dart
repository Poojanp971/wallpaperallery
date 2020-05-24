import 'package:flutter/material.dart';

import 'Global.dart';

class FullImage extends StatefulWidget{
  @override
  _FullImageState createState()=> _FullImageState();
}

class _FullImageState extends State<FullImage>{

  PageController pageController=new PageController(initialPage: Global.Index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: pageController,
            itemCount: Global.photos.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(
                        Global.photos[index].src.large2x),
                        fit: BoxFit.cover)
                ),
                //child: Center(child:  Text("Welcome to Full Image"),
              );
            }
        )
    );
  }
}
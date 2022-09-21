import 'dart:ui';

import 'package:flutter/material.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              CircleAvatar(

              ),
              SizedBox(width: 8.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Faza", style: TextStyle(fontSize: 14.0),),
                  Text("11.59",style: TextStyle(fontSize: 10.0),)
                ],
              )
            ],
          ),
         actions: [Icon(Icons.videocam), SizedBox(width: 8.0,), Icon(Icons.call), SizedBox(width: 8.0,), Icon(Icons.format_list_bulleted)],
        ),
      body: Center(child: Text("Under Constructions"),),
    );
  }
}

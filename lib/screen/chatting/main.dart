import 'dart:ui';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(),
            SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Faza",
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  "11.59",
                  style: TextStyle(fontSize: 10.0),
                )
              ],
            )
          ],
        ),
        actions: [
          Icon(Icons.videocam),
          SizedBox(
            width: 8.0,
          ),
          Icon(Icons.call),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  BubbleSpecialOne(text: "TESTING", seen: true, isSender: true,),
                ],
              ),
            ),
            flex: 7,
          ),
          Expanded(
            child: MessageBar(),
          )
        ],
      ),
    );
  }
}

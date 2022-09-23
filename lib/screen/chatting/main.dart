import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class ChattingScreen extends StatefulWidget {
  final String name;

  const ChattingScreen({required this.name, Key? key}) : super(key: key);

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  final String lastSeen = "08.02";
  final List<BubbleSpecialOne> _message = [];
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const CircleAvatar(),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 14.0),
                ),
                Text(
                  lastSeen,
                  style: const TextStyle(fontSize: 10.0),
                )
              ],
            )
          ],
        ),
        actions: const [
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
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  BubbleSpecialOne(
                    text: "TESTING",
                    seen: true,
                    isSender: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70.0,
            child: MessageBar(
              onSend: (String) {
                var message = const BubbleSpecialOne(text: "text");
                setState(() {
                  _message.insert(0, message);
                });
              },
              replyingTo: _textController.text,
            ),
          )
        ],
      ),
    );
  }

  // void sendMessage() {
  //   var message = BubbleSpecialOne(text: text);
  //   setState(() {
  //     _message.insert(0, message);
  //   });
  // }
}

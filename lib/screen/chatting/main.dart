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
        leadingWidth: 18.0,
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
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(Icons.videocam),
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(child: Text('Lihat kontak')),
              const PopupMenuItem(child: Text('Media, tautan, dan dok')),
              const PopupMenuItem(child: Text('Cari')),
              const PopupMenuItem(child: Text('Bisukan notifikasi')),
              const PopupMenuItem(child: Text('Pesan sementara')),
              const PopupMenuItem(child: Text('Wallpaper')),
              const PopupMenuItem(child: Text('Lainnya')),
            ],
          ),
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
              onSend: (String str) {
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

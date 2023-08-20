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
      backgroundColor: Colors.amber[50],
      body: Padding(
        padding:
            const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 3.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (_, index) => Align(
                  alignment: Alignment.topRight,
                  child: _message[index],
                ),
                itemCount: _message.length,
              ),
            ),
            SizedBox(
              height: 70.0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          controller: _textController,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          minLines: 1,
                          maxLines: 3,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.emoji_emotions_outlined),
                            hintText: "Ketik pesan",
                            suffixIcon: const Icon(Icons.camera_alt),
                            hintMaxLines: 1,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            hintStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 0.2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 0.2,
                              ),
                            ),
                          ),
                          onSubmitted: sendMessage,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 3.0),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.mic,
                            size: 28.0,
                          ),
                          color: Colors.white,
                          onPressed: () => sendMessage(_textController.text),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendMessage(String text) {
    var message = BubbleSpecialOne(text: text);
    setState(() {
      _message.insert(0, message);
    });
  }
}

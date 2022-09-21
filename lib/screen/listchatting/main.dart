import 'package:flutter/material.dart';
import 'package:my_whatsapp/screen/chatting/main.dart';

class ListChatScreen extends StatefulWidget {
  const ListChatScreen({Key? key}) : super(key: key);

  @override
  State<ListChatScreen> createState() => _ListChatScreenState();
}

class _ListChatScreenState extends State<ListChatScreen> {
  List<String> chatList = ["Dion", "Bolot", "Faza", "Bjorka", "Dwiki", "Aldi"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemChat(name: chatList[index]);
        },
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  final String name;

  const ItemChat({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChattingScreen(),
          ),
        );
      },
      leading: ExcludeSemantics(
        child: CircleAvatar(
          radius: 24.0,
          child: Text(
            name.characters.first,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          const Text(
            '23.42',
            style: TextStyle(color: Colors.black45, fontSize: 12.0),
          )
        ],
      ),
      subtitle: const Text(
        'Pesan ini telah dihapus',
        style: TextStyle(
            color: Colors.black45, fontStyle: FontStyle.italic, fontSize: 14.0),
      ),
    );
  }
}

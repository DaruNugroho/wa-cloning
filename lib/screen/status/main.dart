import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _State();
}

class _State extends State<StatusScreen> {
  List<Status> listStatus = [
    Status("Dion", 5),
    Status("Meli", 9),
    Status("Bolot", 19),
    Status("Faza", 49)
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyStatus(),
            Text(
              "Pembaruan terkini",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            ItemStatus(name: "Dion", time: 19),
            ItemStatus(name: "Meli", time: 2),
            ItemStatus(name: "Bolot", time: 3),
            ItemStatus(name: "Denot", time: 45),
            ItemStatus(name: "Dion", time: 19),
            ItemStatus(name: "Meli", time: 2),
            ItemStatus(name: "Bolot", time: 3),
            ItemStatus(name: "Denot", time: 45),
          ],
        ),
      ),
    );
  }
}

class MyStatus extends StatelessWidget {
  const MyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 24.0,
        child: Text(
          'S',
        ),
      ),
      title: Text(
        'Status saya',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Ketuk untuk menambahkan pembaruan',
        style: TextStyle(fontSize: 13.0),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  final String name;
  final int time;

  const ItemStatus({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24.0,
        child: Text(name.characters.first),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('$time menit yang lalu'),
    );
  }
}

class Status {
  String name;
  int time;

  Status(this.name, this.time);
}

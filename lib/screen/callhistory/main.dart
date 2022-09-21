import 'package:flutter/material.dart';

enum CallType { INCOMMING_CALL, OUTGOING_CALL, VIDEO_CALL }

class HistoryCallScreen extends StatefulWidget {
  const HistoryCallScreen({Key? key}) : super(key: key);

  @override
  State<HistoryCallScreen> createState() => _HistoryCallScreenState();
}

class _HistoryCallScreenState extends State<HistoryCallScreen> {
  List<Call> listCall = [
    Call("Agustina", "20.00", CallType.OUTGOING_CALL),
    Call("Ahmad Faza", "20.00", CallType.INCOMMING_CALL),
    Call("Dion", "20.00", CallType.VIDEO_CALL),
    Call("Deni", "20.00", CallType.OUTGOING_CALL),
    Call("Dwiki", "07.00", CallType.INCOMMING_CALL),
    Call("Bolot", "20.00", CallType.VIDEO_CALL),
    Call("Aldi", "20.00", CallType.OUTGOING_CALL)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ItemHistory(
          name: listCall[index].name,
          time: listCall[index].time,
          type: listCall[index].typeCall,
        );
      },
      itemCount: listCall.length,
    );
  }
}

class ItemHistory extends StatefulWidget {
  final String name;
  final String time;
  final CallType type;

  const ItemHistory(
      {super.key, required this.name, required this.time, required this.type});

  @override
  State<ItemHistory> createState() => _ItemHistoryState();
}

class _ItemHistoryState extends State<ItemHistory> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        typeIconCall(widget.type),
        color: Colors.teal,
      ),
      leading: ExcludeSemantics(
        child: CircleAvatar(
          radius: 24.0,
          child: Text(widget.name.characters.first),
        ),
      ),
      title: Text(
        widget.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          iconType(widget.type),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Kemarin ${widget.time}',
            ),
          ),
        ],
      ),
    );
  }

  Icon iconType(CallType callType) {
    switch (callType) {
      case CallType.INCOMMING_CALL:
        {
          return const Icon(
            Icons.call_made,
            color: Colors.teal,
            size: 16.0,
          );
        }
      case CallType.OUTGOING_CALL:
        {
          return const Icon(
            Icons.call_received,
            color: Colors.red,
            size: 16.0,
          );
        }
      case CallType.VIDEO_CALL:
        {
          return const Icon(
            Icons.call_received,
            color: Colors.teal,
            size: 16.0,
          );
        }
    }
  }

  IconData typeIconCall(CallType callType) {
    switch (callType) {
      case CallType.INCOMMING_CALL:
        {
          return Icons.call;
        }
      case CallType.OUTGOING_CALL:
        {
          return Icons.call;
        }
      case CallType.VIDEO_CALL:
        {
          return Icons.videocam_rounded;
        }
    }
  }
}

class Call {
  String name;
  String time;
  CallType typeCall;

  Call(this.name, this.time, this.typeCall);
}

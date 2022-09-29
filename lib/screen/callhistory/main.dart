import 'package:flutter/material.dart';

enum CallType { inCommingCall, outGoingCall, videoCall }

class HistoryCallScreen extends StatefulWidget {
  const HistoryCallScreen({Key? key}) : super(key: key);

  @override
  State<HistoryCallScreen> createState() => _HistoryCallScreenState();
}

class _HistoryCallScreenState extends State<HistoryCallScreen> {
  List<Call> listCall = [
    Call("Agustina", "20.00", CallType.outGoingCall),
    Call("Ahmad Faza", "20.00", CallType.inCommingCall),
    Call("Dion", "20.00", CallType.videoCall),
    Call("Deni", "20.00", CallType.outGoingCall),
    Call("Dwiki", "07.00", CallType.inCommingCall),
    Call("Bolot", "20.00", CallType.videoCall),
    Call("Aldi", "20.00", CallType.outGoingCall)
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
      case CallType.inCommingCall:
        {
          return const Icon(
            Icons.call_made,
            color: Colors.teal,
            size: 16.0,
          );
        }
      case CallType.outGoingCall:
        {
          return const Icon(
            Icons.call_received,
            color: Colors.red,
            size: 16.0,
          );
        }
      case CallType.videoCall:
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
      case CallType.inCommingCall:
        {
          return Icons.call;
        }
      case CallType.outGoingCall:
        {
          return Icons.call;
        }
      case CallType.videoCall:
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

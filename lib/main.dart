import 'package:flutter/material.dart';
import 'package:my_whatsapp/config/theme/light.dart';
import 'package:my_whatsapp/screen/callhistory/main.dart';
import 'package:my_whatsapp/screen/listchatting/main.dart';
import 'package:my_whatsapp/screen/status/main.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(primarySwatch: AppColors.primary),
      home: const MyHomePage(title: "WhatsApp"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: selectedIndex);
    _tabController.addListener(_handleTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {
      selectedIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: const [Icon(Icons.search)],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(Icons.camera_alt),
                    Text('CHAT')
                  ],
                ),
              ),
              const Tab(text: 'STATUS'),
              const Tab(text: 'PANGGILAN'),
            ],
          ),
        ),
        floatingActionButton: _fabIcon(),
        body: TabBarView(
          controller: _tabController,
          children: const [
            ListChatScreen(),
            StatusScreen(),
            HistoryCallScreen(),
          ],
        ),
      ),
    );
  }

  Widget _fabIcon() {
    switch (_tabController.index) {
      case 0:
        {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.chat),
          );
        }
      case 1:
        {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.camera_alt),
          );
        }
      default:
        {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_call),
          );
        }
    }
  }
}

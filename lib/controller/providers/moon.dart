import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_whatsapp/screen/home/main.dart';
import 'package:my_whatsapp/screen/welcome/main.dart';

class ProviderMoon extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  bool isAuth = false;
  bool isLoading = false;

  void setAuth(bool newValue) async {
    isAuth = newValue;
    await storage.write(key: 'isAuth', value: newValue.toString());
    notifyListeners();
  }

  void checkLogin(BuildContext context) async {
    String? value = await storage.read(key: 'isAuth');
    if (true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreen();
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    }
  }
}

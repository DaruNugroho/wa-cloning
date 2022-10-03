import 'package:flutter/material.dart';
import 'package:my_whatsapp/config/theme/light.dart';
import 'package:my_whatsapp/controller/providers/moon.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderMoon(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: AppColors.primary),
        home: const CheckAuth(),
      ),
    );
  }
}

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderMoon>(builder: (context, provMoon, _) {
      provMoon.checkLogin(context);
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}

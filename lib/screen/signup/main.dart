import 'package:flutter/material.dart';
import 'package:my_whatsapp/screen/home/main.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset('./assets/images/splash1.png'),
                ),
                SizedBox(
                  // color: Colors.greenAccent,
                  height: size.height / 2,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        'Kami akan mengirimkan 4 digit kode verifikasi',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 54.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Nama'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 54.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Negara'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 54.0,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Nomor Telepon'),
                          ),
                        ),
                      ),
                      MoonButton(
                        text: 'DAFTAR',
                        fullWidth: true,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

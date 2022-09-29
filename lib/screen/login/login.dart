import 'package:flutter/material.dart';
import 'package:my_whatsapp/screen/otp/main.dart';
import 'package:my_whatsapp/screen/signup/main.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset('./assets/images/splash1.png'),
                ),
                SizedBox(
                  //color: Colors.greenAccent,
                  height: size.height / 2,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Log In',
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
                            label: Text('No. Telp'),
                          ),
                        ),
                      ),
                      MoonButton(
                        text: 'KIRIM KODE OTP',
                        fullWidth: true,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerificationScreen(),
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Belum Punya Akun ? '),
                          GestureDetector(
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                color: Colors.purple[900],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      )
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

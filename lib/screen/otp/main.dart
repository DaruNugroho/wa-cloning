import 'package:flutter/material.dart';
import 'package:my_whatsapp/screen/home/main.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
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
                            'Verifikasi Kode OTP',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text(
                          'Masukkan kode OTP yang dikirimkan ke nomor +6282288223322',
                          textAlign: TextAlign.center,
                        ),
                        MoonButton(
                          text: 'Masuk',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Tidak menerima kode OTP ? '),
                            Text(
                              'Kirim Ulang',
                              style: TextStyle(
                                color: Colors.purple[900],
                              ),
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
      ),
    );
  }
}

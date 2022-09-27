import 'package:flutter/material.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
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
                          // height: 48.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Negara'),
                              hintText: 'Pilih Negara',
                            ),
                          ),
                        ),
                        const SizedBox(
                          // height: 48.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('No. Telp'),
                              hintText: 'Nomor Telepon',
                            ),
                          ),
                        ),
                        const MoonButton(
                          text: 'KIRIM KODE OTP',
                          fullWidth: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Belum Punya Akun ?'),
                            Text(
                              'Daftar',
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

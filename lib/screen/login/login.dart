import 'package:flutter/material.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Quantums',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 42.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 24.0,
                bottom: 24.0,
              ),
              child: Text(
                "Log in untuk melanjutkan ke halaman QTeams",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Card(
                shadowColor: Colors.black,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 42.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(
                                'Pilih Negara',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 42.0,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(
                                'No. Telp',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        const MoonButton(
                          text: "Kirim Kode OTP",
                          fullWidth: true,
                          customColor: Colors.blue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Text(
                              'Belum Punya Akun ?',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Daftar Dulu',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

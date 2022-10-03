import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/screen/home/main.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

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
                      SizedBox(
                        height: 54.0,
                        child: TextField(
                          scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context)
                                .viewInsets
                                .bottom, // supaya tombol tidak tertutup
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Nama'),
                          ),
                        ),
                      ),
                      DropdownButtonFormField2(
                        buttonHeight: 16.0,
                        hint: const Text('Pilih Negara'),
                        isExpanded: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        items: items
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        value: selectedValue,
                        onChanged: ((value) {}),
                      ),
                      SizedBox(
                        height: 54.0,
                        child: TextField(
                          scrollPadding: EdgeInsets.only(
                            // supaya tombol tidak tertutup keyboard
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
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
                        borderRadius: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Sudah Punya Akun ? '),
                          GestureDetector(
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.purple[900],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
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

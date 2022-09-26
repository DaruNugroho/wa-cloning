import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_whatsapp/widget/moon_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final CarouselController carouselCtrl = CarouselController();
  int _page = 0;

  String changeTitle(int page) {
    switch (page) {
      case 0:
        return "Solusi Berbisnis";
      case 1:
        return "Simpel Manajemen";
      case 2:
        return "Spesifik Chat";
    }
    return '';
  }

  String changeSubTitle(int page) {
    switch (page) {
      case 0:
        return "Tidak perlu khawatir, QTeams menjadi solusi berbisnis untuk mengatur perusahaanmu dengan baik";
      case 1:
        return "Tidak perlu khawatir, QTeams mempermudah mengatur perusahaanmu dengan simpel manajemen";
      case 2:
        return "Tidak perlu khawatir, QTeams mendukung spesifik chat untuk mengatur perusahaanmu dengan baik";
    }
    return '';
  }

  String changeImage(int page) {
    switch (page) {
      case 0:
        return "./assets/images/splash1.png";
      case 1:
        return "./assets/images/splash2.png";
      case 2:
        return "./assets/images/splash3.png";
    }
    return './assets/images/splash1.png';
  }

  Widget bubleSlide(int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[900],
            borderRadius: BorderRadius.circular(12),
          ),
          height: 8,
          width: page == 0 ? 20 : 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[900],
            borderRadius: BorderRadius.circular(12),
          ),
          height: 8,
          width: page == 1 ? 20 : 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[900],
            borderRadius: BorderRadius.circular(12),
          ),
          height: 8,
          width: page == 2 ? 20 : 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'QTeams',
            style: TextStyle(
              color: Colors.purple[900],
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          CarouselSlider(
            items: [0, 1, 2]
                .map(
                  (item) => Image.asset(
                    changeImage(item),
                  ),
                )
                .toList(),
            options: CarouselOptions(
                onPageChanged: (index, _) {
                  setState(() {
                    _page = index;
                  });
                },
                height: size.height / 3,
                enlargeCenterPage: false,
                viewportFraction: 1.0),
          ),
          SizedBox(
            width: 64.0,
            child: bubleSlide(_page),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
            ),
            child: Text(
              changeTitle(_page),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 64.0),
            child: Text(
              changeSubTitle(_page),
              textAlign: TextAlign.center,
            ),
          ),
          const MoonButton(
            text: 'Lewati',
          ),
        ],
      ),
    ));
  }
}

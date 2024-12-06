import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pa_mobile/pages/Welcome.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Text(
        "Selanjutnya",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      done: const Text(
        "Selesai",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WelcomePage(),
          ),
        );
      },
      pages: [
        PageViewModel(
          title: "Selamat Datang",
          body: "Animal Edu App adalah aplikasi edukasi tentang dunia hewan yang menarik dan juga menyenangkan. Pada aplikasi ini kita bisa mengetahui hewan yang ingin kita cari dengan mudah.",
          image: Image.asset(
            'lib/images/welcome1.png',
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        PageViewModel(
          title: "Pelajari dan Jelajahi",
          body: "Temukan berbagai informasi tentang hewan amfibi dan reptil dengan vitur scan yang tersedia pada aplikasi kami 😁.",
          image: Image.asset(
            "lib/images/babi.jpg",
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        PageViewModel(
          title: "Mulai Sekarang",
          body: "Klik tombol 'Mulai' untuk memulai perjalanan edukasi Anda.",
          image: Image.asset(
            'lib/images/animal.jpg',
            height: 250,
            fit: BoxFit.contain,
          ),
          ),
      ],
      globalBackgroundColor: Colors.white,
      showSkipButton: true,
      skip: const Text(
        "Lewati",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

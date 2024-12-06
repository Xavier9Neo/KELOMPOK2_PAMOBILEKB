import 'package:flutter/material.dart';
import 'package:pa_mobile/pages/HomePage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Membuat semua elemen berada di tengah
        child: Column(
          mainAxisSize: MainAxisSize.min, // Menghindari jarak vertikal otomatis
          children: [
            Image.asset(
              'lib/images/welcome1.png',
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20), // Jarak antar elemen
            const Text(
              'Animal Edu App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Material(
              color: const Color.fromARGB(255, 118, 174, 137),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 234, 214),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
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

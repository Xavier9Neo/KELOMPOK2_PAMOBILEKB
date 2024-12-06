import 'package:flutter/material.dart';
import 'package:pa_mobile/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromRGBO(146, 57, 51, 1.0)
            : const Color.fromRGBO(212, 123, 39, 1.0),
      ),
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromRGBO(122, 105, 97, 1.0)
          : const Color.fromRGBO(240, 234, 212, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About AnimalEdu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Animal Edu App adalah aplikasi edukasi tentang dunia hewan yang menarik dan juga menyenangkan. '
              'Pada aplikasi ini kita bisa mengetahui hewan yang ingin kita cari tahu dengan mudah. '
              'Cara menggunakan aplikasi ini cukup gampang, kita dapat mengimport gambar atau memfoto gambar hewan yang ingin kita cari tahu',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

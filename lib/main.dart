import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pa_mobile/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:pa_mobile/pages/IntroductionPage.dart'; // Import halaman utama
import 'package:pa_mobile/provider/ThemeProvider.dart'; // Import ThemeProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'AnimalEdu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Tema terang default
      darkTheme: ThemeData.dark(), // Tema gelap default
      themeMode: themeProvider.isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light, // Mengatur tema berdasarkan preferensi pengguna
      home: const IntroductionPage(), // Menampilkan halaman utama
    );
  }
}

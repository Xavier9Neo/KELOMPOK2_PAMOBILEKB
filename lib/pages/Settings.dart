import 'package:flutter/material.dart';
import 'package:pa_mobile/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'AboutPage.dart';

class MySettingPage extends StatelessWidget {
  const MySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromRGBO(122, 105, 97, 1.0)
          : const Color.fromRGBO(240, 234, 212, 1.0),
      body: ListView(
        children: [
          // Dark Mode Toggle
          ListTile(
            leading: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
          const Divider(),

          // About
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              // Navigasi ke halaman AboutPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          const Divider(),

      //     // Login
      //     ListTile(
      //       leading: const Icon(Icons.login),
      //       title: const Text('Login'),
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => SignInPage(),
      //           ),
      //         );
      //       },
      //     ),
      //     const Divider(),

      //     // Register
      //     ListTile(
      //       leading: const Icon(Icons.app_registration),
      //       title: const Text('Register'),
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => SignUpPage(),
      //           ),
      //         );
      //       },
      //     ),
        ],
      ),
    );
  }
}

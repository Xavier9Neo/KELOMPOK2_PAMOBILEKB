import 'package:flutter/material.dart';
import 'package:pa_mobile/pages/auth.dart'; // Pastikan file ini ada
import 'package:pa_mobile/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'SignUp.dart';
import 'HomePage.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  @override
  void dispose() {
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _ctrlEmail.text;
    final password = _ctrlPassword.text;

    setState(() => _loading = true);

    try {
      // Pastikan Auth().signIn dipanggil dengan parameter yang benar
      await Auth().loginWithEmailPassword(
          email, password); // Sesuaikan dengan method signIn dari Auth()

      // Mengarahkan ke halaman Home setelah login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } catch (error) {
      // Menangani jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $error')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromRGBO(122, 105, 97, 1.0)
          : const Color.fromRGBO(240, 234, 212, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromRGBO(146, 57, 51, 1.0)
            : const Color.fromRGBO(212, 123, 39, 1.0),
        title: Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
  controller: _ctrlEmail,
  decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: TextStyle(
      color: themeProvider.isDarkMode
          ? Colors.white70
          : Colors.black87,
    ),
    hintText: 'Enter your email',
    hintStyle: TextStyle(
      color: themeProvider.isDarkMode
          ? Colors.white54
          : Colors.black45,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: themeProvider.isDarkMode
            ? const Color.fromRGBO(207, 118, 76, 1.0)
            : const Color.fromRGBO(76, 174, 137, 1.0),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: themeProvider.isDarkMode
            ? const Color.fromRGBO(79, 93, 119, 1.0)
            : const Color.fromRGBO(229, 190, 95, 1.0),
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(180, 42, 34, 1.0),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(180, 42, 34, 1.0),
        width: 2.0,
      ),
    ),
  ),
  style: TextStyle(
    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  },
),

                SizedBox(height: 16),
                TextFormField(
                  controller: _ctrlPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white70
                          : Colors.black87,
                    ),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white54
                          : Colors.black45,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeProvider.isDarkMode
                            ? const Color.fromRGBO(207, 118, 76, 1.0)
                            : const Color.fromRGBO(76, 174, 137, 1.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeProvider.isDarkMode
                            ? const Color.fromRGBO(79, 93, 119, 1.0)
                            : const Color.fromRGBO(229, 190, 95, 1.0),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color:
                        themeProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loading ? null : handleSubmit,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: themeProvider.isDarkMode
                        ? const Color.fromRGBO(207, 118, 76, 1.0)
                        : const Color.fromRGBO(76, 174, 137, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _loading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          "Sign In",
                          style: TextStyle(
                            color: themeProvider.isDarkMode
                                ? Colors.white70
                                : Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white70
                          : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
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

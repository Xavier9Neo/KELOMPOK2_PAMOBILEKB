import 'package:flutter/material.dart';
import 'package:pa_mobile/pages/auth.dart';
import 'package:pa_mobile/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlConfirmPassword = TextEditingController();
  final TextEditingController _ctrlUsername = TextEditingController();

  @override
  void dispose() {
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    _ctrlConfirmPassword.dispose();
    _ctrlUsername.dispose();
    super.dispose();
  }

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _ctrlEmail.text;
    final password = _ctrlPassword.text;
    final username = _ctrlUsername.text;

    setState(() => _loading = true);

    try {
      await Auth().registerWithEmailPassword(email, password, username);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful!')),
      );
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $error')),
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
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Tambahkan ini
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextInput(
                    controller: _ctrlUsername,
                    label: 'Username',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a username' : null,
                    themeProvider: themeProvider,
                  ),
                  SizedBox(height: 16),
                  _buildTextInput(
                    controller: _ctrlEmail,
                    label: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    themeProvider: themeProvider,
                  ),
                  SizedBox(height: 16),
                  _buildTextInput(
                    controller: _ctrlPassword,
                    label: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    themeProvider: themeProvider,
                  ),
                  SizedBox(height: 16),
                  _buildTextInput(
                    controller: _ctrlConfirmPassword,
                    label: 'Confirm Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _ctrlPassword.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    themeProvider: themeProvider,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _loading ? null : handleSubmit,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: Colors.black,
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
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Already have an account? Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput({
  required TextEditingController controller,
  required String label,
  required ThemeProvider themeProvider,
  String? Function(String?)? validator,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
      ),
      hintText: 'Enter your $label',
      hintStyle: TextStyle(
        color: themeProvider.isDarkMode ? Colors.white54 : Colors.black45,
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
              ? const Color.fromRGBO(212, 123, 39, 1.0)
              : const Color.fromRGBO(146, 57, 51, 1.0),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(  
        borderSide: BorderSide(
          color: Color.fromRGBO(180, 42, 34, 1.0), 
          width: 2.0,
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
    obscureText: obscureText,
    validator: validator,
  );
}

}

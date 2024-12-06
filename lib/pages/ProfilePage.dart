import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pa_mobile/pages/SignIn.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'auth.dart';
import 'package:pa_mobile/provider/ThemeProvider.dart';

class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final Auth _auth = Auth();
  File? _coverImage;
  File? _profileImage;
  final picker = ImagePicker();
  String _username = 'username';
  String _email = 'Animal lovers';
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _fetchUsername();
  }

  Future<void> _checkLoginStatus() async {
    final user = _auth.currentUser();
    setState(() {
      isLoggedIn = user != null;
      if (isLoggedIn) {
        _email = user!.email ?? 'No Email';
      }
    });
  }

  Future<void> _fetchUsername() async {
    final user = _auth.currentUser();
    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      setState(() {
        _username = userData.data()?['username'] ?? 'username';
      });
    }
  }

  Future<void> pickCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
      });
    }
  }

  Future<void> pickProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _editUsername(BuildContext context) async {
    String newUsername = _username;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Username'),
          content: TextField(
            onChanged: (value) {
              newUsername = value;
            },
            decoration: InputDecoration(hintText: 'Enter your username'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                Navigator.pop(context);
                try {
                  // Simpan username baru ke Firestore
                  final user = _auth.currentUser();
                  if (user != null) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .update({'username': newUsername});

                    setState(() {
                      _username = newUsername;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Username updated successfully')),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error updating username: $e')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  



  void _handleButtonPress() {
    if (!isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    } else {
      _editUsername(context);
    }
  }

Future<void> _logout() async {
  await _auth.logout();
  setState(() {
    isLoggedIn = false;
    _email = 'Animal lovers';
    _username = 'username'; // Reset username to default
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Logged out successfully')),
  );
}


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromRGBO(122, 105, 97, 1.0)
          : const Color.fromRGBO(240, 234, 212, 1.0),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromRGBO(146, 57, 51, 1.0)
            : const Color.fromRGBO(212, 123, 39, 1.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: pickCoverImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode
                      ? Colors.grey[800]
                      : Colors.grey[300],
                  image: _coverImage != null
                      ? DecorationImage(
                          image: FileImage(_coverImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _coverImage == null
                    ? Center(
                        child: Icon(
                          Icons.image,
                          size: 50,
                          color: themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black54,
                        ),
                      )
                    : null,
              ),
            ),
            SizedBox(height: 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: GestureDetector(
                    onTap: pickProfileImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: themeProvider.isDarkMode
                          ? Colors.grey[700]
                          : Colors.grey[400],
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      child: _profileImage == null
                          ? Icon(Icons.person,
                              size: 40,
                              color: themeProvider.isDarkMode
                                  ? Colors.white
                                  : Colors.black54)
                          : null,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: _handleButtonPress,
                    icon: Icon(
                      isLoggedIn ? Icons.edit : Icons.login,
                      size: 18,
                      color: Theme.of(context)
                          .iconTheme
                          .color,
                    ),
                    label: Text(
                      isLoggedIn ? 'Edit Username' : 'Login Here',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeProvider.isDarkMode
                          ? const Color.fromRGBO(207, 118, 76, 1.0)
                          : const Color.fromRGBO(76, 174, 137, 1.0),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: isLoggedIn ? () => _editUsername(context) : null,
                child: Text(
                  _username,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkMode
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _email,
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.isDarkMode
                      ? Colors.white70
                      : Colors.black54,
                ),
              ),
            ),
            if (isLoggedIn) ...[
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _logout,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge?.color,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeProvider.isDarkMode
                        ? const Color.fromRGBO(207, 118, 76, 1.0)
                        : const Color.fromRGBO(76, 174, 137, 1.0),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
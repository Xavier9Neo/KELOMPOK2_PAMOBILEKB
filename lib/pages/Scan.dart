import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyScanPage extends StatefulWidget {
  const MyScanPage({super.key});

  @override
  State<MyScanPage> createState() => _MyScanPageState();
}

class _MyScanPageState extends State<MyScanPage> {
  File? _image;
  final picker = ImagePicker();

  // Fungsi untuk mengambil gambar dari galeri
  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image picked');
      }
    });
  }

  // Fungsi untuk mengambil gambar dari kamera
  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image captured');
      }
    });
  }

  // Menampilkan modal untuk memilih sumber gambar
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Scan from Camera'),
                onTap: () {
                  Navigator.pop(context); // Tutup modal
                  getImageCamera(); // Buka kamera
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Upload from Device'),
                onTap: () {
                  Navigator.pop(context); // Tutup modal
                  getImageGallery(); // Buka galeri
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi untuk menampilkan pop-up dialog
  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Scan Page'),
      //   backgroundColor: const Color.fromARGB(255, 74, 118, 83),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container untuk menampilkan gambar
            InkWell(
              onTap: () {
                _showImageSourceActionSheet(context);
              },
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 239, 234, 214)),
                ),
                child: _image != null
                    ? Image.file(
                        _image!.absolute,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 30,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Submit untuk navigasi ke halaman Home
            InkWell(
              onTap: () {
                if (_image == null) {
                  // Jika gambar belum dipilih, tampilkan pop-up peringatan
                  _showAlertDialog(
                    'Peringatan',
                    'Masukkan gambar terlebih dahulu!',
                  );
                } else {
                  // Jika gambar sudah ada, tampilkan pop-up "Hasil"
                  _showAlertDialog(
                    'Berhasil',
                    'Gambar berhasil diproses!',
                  );
                  // Navigasi ke halaman Home
                  Navigator.pushNamed(context, '/home');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 74, 118, 83),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 239, 234, 214),
                    fontSize: 16,
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
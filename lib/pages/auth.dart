// import 'package:firebase_auth/firebase_auth.dart';

// class Auth {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   Future<void> regis(String email, String password) async {
//     final user = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   Future<void> login(String email, String password) async {
//     final user = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register new user
  Future<User?> registerWithEmailPassword(String email, String password, String username) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Create a new user document in Firestore
      User? user = userCredential.user;
      if (user != null) {
        // Store user email and username in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'username': username,
          'uid': user.uid,
        });

        return user;
      }
      return null;
    } catch (e) {
      print("Error during registration: $e");
      return null;
    }
  }

  // Login user
  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error during login: $e");
      // Handle more specific error if needed
      throw e; // Re-throw error for handling in the UI
    }
  }

  // Get current user
  User? currentUser() {
    return _firebaseAuth.currentUser;
  }

  // Logout user
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  // Update username in Firestore
  Future<void> updateUsername(String uid, String newUsername) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'username': newUsername,
      });
    } catch (e) {
      print("Error updating username: $e");
    }
  }
}

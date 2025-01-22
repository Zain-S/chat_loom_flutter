import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseDataSource {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  firebase.User? get currentAuthUser => _auth.currentUser;

  Stream<firebase.User?> get currentUserStream => _auth.authStateChanges();
  Stream<String?> get getPhotoUrl =>
      currentUserStream.map((firebase.User? user) => user?.photoURL);
  Stream<String?> get getUserName =>
      currentUserStream.map((firebase.User? user) => user?.displayName);
  Stream<String?> get getUserEmail =>
      currentUserStream.map((firebase.User? user) => user?.email);
  Stream<String?> get getUserPhoneNumber =>
      currentUserStream.map((firebase.User? user) => user?.phoneNumber);

  // create account
  /*Future<ResultData<User>> createUserAccount(User user) async{
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.phone,
      );

    }
  }*/

  Future<firebase.User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> getUserAccount(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(uid).get();
      if (snapshot.exists) {
        // Convert snapshot to User object or handle data
        var user = snapshot.data();
        if (kDebugMode) {
          print('User data: $user');
        }
      } else {
        print('User not found');
      }
    } catch (e) {
      print('Error getting user: $e');
    }
  }

  /*Future<ResultData<String>> insertUserPhoto(Uri imageUri) async {
    try {
      Reference ref =
          _storage.ref(currentAuthUser?.uid).child(imageUri.pathSegments.last);
      UploadTask uploadTask = ref.putFile(File(imageUri));

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }*/

  Future<String?> uploadUserPhoto(String uid, String filePath) async {
    try {
      Reference ref = _storage.ref().child(uid).child('profile_photo.jpg');
      UploadTask uploadTask = ref.putFile(File(filePath));

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading photo: $e');
      }
      return null;
    }
  }

  Future<void> sendMessage(Map<String, dynamic> message) async {
    try {
      await _firestore.collection('messages').add(message);
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getMessages() {
    return _firestore.collection('messages').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> editMessage(
      String docId, Map<String, dynamic> updatedMessage) async {
    try {
      await _firestore.collection('messages').doc(docId).update(updatedMessage);
    } catch (e) {
      print('Error editing message: $e');
    }
  }

  Future<String?> uploadImage(String uid, String filePath) async {
    try {
      Reference ref =
          _storage.ref().child(uid).child('images').child('uploaded_image.jpg');
      UploadTask uploadTask = ref.putFile(File(filePath));

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}

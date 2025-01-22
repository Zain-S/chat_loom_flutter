import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String name;
  final String email;
  final String phone;
  String photoUrl;
  List<String> conversationIds;

  User({
    this.id,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.photoUrl = '',
    this.conversationIds = const [],
  });

  // Factory constructor to create a User from a Firestore document snapshot
  factory User.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      conversationIds: List<String>.from(data['conversationIds'] ?? []),
    );
  }

  // Method to convert a User instance to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
      'conversationIds': conversationIds,
    };
  }
}

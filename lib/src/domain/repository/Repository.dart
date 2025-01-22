import 'dart:ffi';

import 'package:chat_loom_flutter/src/domain/model/user.dart';
import 'package:chat_loom_flutter/src/utils/result_data.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

abstract class Repository {
  firebase.User get currentAuthUser;
  Stream<firebase.User?> get currentUserStream;
  Stream<User?> get currentUserAccountStream;
  Stream<String?> get getPhotoUrl;
  Stream<String?> get getUserName;
  Stream<String?> get getUserEmail;
  Stream<String?> get getUserPhoneNumber;
  Stream<Bool> get isUserLoggedIn;
  Future<User?> getCurrentUser();
  Future<ResultData<String>> createUserAccount(User user, Uri? uri);
  Future<Bool> isUserExist(String email);
}

import 'dart:ffi';

import 'package:chat_loom_flutter/src/domain/model/user.dart';
import 'package:chat_loom_flutter/src/utils/result_data.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:get_it/get_it.dart';

import '../../domain/repository/Repository.dart';
import '../datasource/firebase_data_source.dart';

class FirebaseRepository extends Repository {
  final FirebaseDataSource _dataSource = GetIt.instance<FirebaseDataSource>();

  @override
  Future<ResultData<String>> createUserAccount(User user, Uri? uri) {
    // TODO: implement currentAuthUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentAuthUser
  firebase.User get currentAuthUser => throw UnimplementedError();

  @override
  // TODO: implement currentUserAccountStream
  Stream<User?> get currentUserAccountStream => throw UnimplementedError();

  @override
  // TODO: implement currentUserStream
  Stream<firebase.User?> get currentUserStream => throw UnimplementedError();

  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement getPhotoUrl
  Stream<String?> get getPhotoUrl => throw UnimplementedError();

  @override
  // TODO: implement getUserEmail
  Stream<String?> get getUserEmail => throw UnimplementedError();

  @override
  // TODO: implement getUserName
  Stream<String?> get getUserName => throw UnimplementedError();

  @override
  // TODO: implement getUserPhoneNumber
  Stream<String?> get getUserPhoneNumber => throw UnimplementedError();

  @override
  Future<Bool> isUserExist(String email) {
    // TODO: implement isUserExist
    throw UnimplementedError();
  }

  @override
  // TODO: implement isUserLoggedIn
  Stream<Bool> get isUserLoggedIn => throw UnimplementedError();
}

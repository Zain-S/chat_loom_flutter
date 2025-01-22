import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/result_data.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(super.state);
  /*final CreateUserUseCase createUserUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final IsUserLoggedInUseCase isUserLoggedInUseCase;

  AuthViewModel({
    required this.createUserUseCase,
    required this.getCurrentUserUseCase,
    required this.isUserLoggedInUseCase,
  }) : super(AuthState()) {
    _init();
  }

  void _init() {
    isUserLoggedInUseCase().listen((isLoggedIn) {
      debugPrint('AuthViewModel: isUserLoggedIn: $isLoggedIn');
      state = state.copyWith(isUserLoggedIn: isLoggedIn);
    });
  }

  Future<void> isUserExistAgainst() async {
    state = state.copyWith(isUserExistResponse: ResultDataLoading());
    final user = await getCurrentUserUseCase.getUserOnce();
    if (user is ResultDataSuccess) {
      state = state.copyWith(isUserExistResponse: ResultDataSuccess(true));
    } else if (user is ResultDataFailed) {
      state =
          state.copyWith(isUserExistResponse: ResultData.failed(user.message));
    } else {
      state = state.copyWith(isUserExistResponse: ResultData.exception(null));
    }
  }

  Future<void> createUser(User user, Uri? uri) async {
    state = state.copyWith(createUserResponse: ResultData.loading());
    final result = await createUserUseCase(user, uri);
    state = state.copyWith(createUserResponse: result);
  }*/
}

@immutable
class AuthState {
  final ResultData<bool>? isUserExistResponse;
  final ResultData<String>? createUserResponse;
  final bool? isUserLoggedIn;

  AuthState({
    this.isUserExistResponse,
    this.createUserResponse,
    this.isUserLoggedIn,
  });

  AuthState copyWith({
    ResultData<bool>? isUserExistResponse,
    ResultData<String>? createUserResponse,
    bool? isUserLoggedIn,
  }) {
    return AuthState(
      isUserExistResponse: isUserExistResponse ?? this.isUserExistResponse,
      createUserResponse: createUserResponse ?? this.createUserResponse,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
    );
  }
}

import 'package:get_it/get_it.dart';

import '../../../data/repository/firebase_repository.dart';

class IsUserLoggedInUseCase {
  final FirebaseRepository _firebaseRepository =
      GetIt.instance<FirebaseRepository>();

  Stream<bool> call() {
    return Stream.empty();
  }
}

import 'package:iss_mir_egal/home/models/user.dart';

// für Demonstrationszwecke (quick & dirty):

abstract class AuthRepository {
  User getUser();

  void createUser(String email, String password);
}

class MockAuthRepository implements AuthRepository {
  @override
  User getUser() {
    return User(id: '1', name: 'Karsten');
  }

  @override
  void createUser(String email, String password) {
    // TODO: implement createUser
  }
}

class AuthController {
  final AuthRepository _repository;
  AuthController(this._repository);

  void createUser(String email, String password) {
    _repository.createUser(email, password);
  }
}

import 'dart:async';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  final _controller = StreamController<AppUser?>();
  AppUser? _user;

  MockAuthRepository() {
    _controller.add(null);
  }

  @override
  Stream<AppUser?> get authStateChanges => _controller.stream;

  @override
  AppUser? get currentUser => _user;

  @override
  Future<AppUser?> signInWithEmail(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password') {
      _user = AppUser(id: '1', email: email, displayName: 'Test User');
      _controller.add(_user);
      return _user;
    }
    throw Exception('Invalid credentials');
  }

  @override
  Future<AppUser?> signUpWithEmail(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _user = AppUser(id: '2', email: email, displayName: 'New User');
    _controller.add(_user);
    return _user;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _user = null;
    _controller.add(null);
  }
}

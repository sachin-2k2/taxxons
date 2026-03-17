import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<AppUser?> get authStateChanges => _auth.authStateChanges().map(_userFromFirebase);

  @override
  AppUser? get currentUser => _userFromFirebase(_auth.currentUser);

  AppUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return AppUser(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
    );
  }

  @override
  Future<AppUser?> signInWithEmail(String email, String password) async {
    final credentials = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credentials.user);
  }

  @override
  Future<AppUser?> signUpWithEmail(String email, String password) async {
    final credentials = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credentials.user);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taxxons/features/auth/domain/models/user_model.dart';
import 'package:taxxons/features/auth/domain/repositories/auth_repository.dart';
import 'package:taxxons/features/auth/data/repositories/firebase_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

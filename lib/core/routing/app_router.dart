import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taxxons/features/auth/presentation/screens/login_screen.dart';
import 'package:taxxons/features/auth/presentation/screens/splash_screen.dart';
import 'package:taxxons/features/home/presentation/screens/home_screen.dart';
import 'package:taxxons/features/auth/presentation/providers/auth_providers.dart';

/// Resolves after a minimum splash display duration.
final splashDelayProvider = FutureProvider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 7));
});

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final splashDelay = ref.watch(splashDelayProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final authLoading = !authState.hasValue && !authState.hasError;
      final delayLoading = !splashDelay.hasValue && !splashDelay.hasError;
      final isLoading = authLoading || delayLoading;

      final isAuthenticated = authState.value != null;
      final isSplash = state.matchedLocation == '/splash';
      final isLoggingIn = state.matchedLocation == '/login';

      // Either auth or timer still pending — stay on splash
      if (isLoading) return isSplash ? null : '/splash';

      if (isSplash) {
        if (!isAuthenticated) return '/login';
        return '/';
      }

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});

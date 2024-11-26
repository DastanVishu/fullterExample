// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import '../pages/auth/login.dart';
import '../pages/auth/register.dart';
import '../pages/auth/forgotpassword.dart';
class AuthRoutes {
    static final List<GoRoute> routes = [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpPage(), // Add SignUpPage route
      ),
      GoRoute(
        path: '/forgotpassword',
        builder: (context, state) => const ForgotPasswordPage(), // Add SignUpPage route
      ),
      GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(), // Default route
    ),
    ];
}
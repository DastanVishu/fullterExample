import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './authRoute.dart';
import './userRoute.dart';
import 'dart:developer';

final storage = FlutterSecureStorage(); // Initialize secure storage
class IndexRouter {
  
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      ...AuthRoutes.routes,
      ...UserRoutes.routes
    ],
    redirect: (context, state) async {
      // log("==================!=$state");
      log("==================!=${GoRouter.of(context)}");
      // final token = await storage.read(key: "token");

      // // If token is not found and the user is trying to access the home route
      // if (token == null && state.uri != '/login') {
      //   return '/login'; // Redirect to login if no token is found
      // }

      // // If token is found and the user is trying to access the login route
      // if (token != null && state.uri == '/login') {
      //   return '/home'; // Redirect to home if token exists and trying to access login
      // }

      // return null; // No redirection, proceed with the original route

    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('No route defined for ${state.error}')),
    ),
    );
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './authRoute.dart';
import './userRoute.dart';

class IndexRouter {
  static final GoRouter router = GoRouter(
    routes: [
      ...AuthRoutes.routes,
      ...UserRoutes.routes
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('No route defined for ${state.error}')),
    ),
    );
}
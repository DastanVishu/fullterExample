import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './src/routers/indexRoute.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Social Books",
      routerConfig: IndexRouter.router,
    );
  }
}

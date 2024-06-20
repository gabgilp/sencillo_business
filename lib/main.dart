import 'package:flutter/material.dart';
import 'package:sencillo_business/router/app_router.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadJsonData();
  runApp(const MainApp());
}

Future<void> loadJsonData() async {
  final String jsonString =
      await rootBundle.loadString('assets/data/data.json');
  MainApp.jsonResponse = json.decode(jsonString);
}

class MainApp extends StatelessWidget {
  static dynamic jsonResponse;

  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter, // Your router configuration
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

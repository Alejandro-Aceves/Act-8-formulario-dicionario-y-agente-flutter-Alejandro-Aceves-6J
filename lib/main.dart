import 'package:flutter/material.dart';
import 'inicio.dart';
import 'captura_tours.dart';
import 'ver_tours.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agencia de Tours',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEAEBED),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006989),
          primary: const Color(0xFF006989),
          surface: const Color(0xFFEAEBED),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF006989),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF006989),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => const InicioScreen(),
        '/captura': (context) => const CapturaToursScreen(),
        '/ver': (context) => const VerToursScreen(),
      },
    );
  }
}

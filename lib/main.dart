import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/tabs.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 131, 57, 0)));
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(), // Sử dụng Google Fonts
      ),
      home: const TabsScreen(), // Đặt HomeScreen là widget chính
    );
  }
}

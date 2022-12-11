import 'package:flutter/material.dart';
import 'core/constants/palette/palette.dart';
import 'core/locator.dart';
import 'presentation/presentation.dart';

void main() {
  initiAlizeLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: const ColorScheme.light().copyWith(
            secondary: Palette.deepBlue,
          )),
      home: const NewsHomeScreen(),
    );
  }
}

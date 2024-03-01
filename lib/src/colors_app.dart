import 'package:flutter/material.dart';
import 'package:flutter_colors/src/features/colors_generator_screen.dart';

/// Starting screen of the app
class ColorsApp extends StatelessWidget {
  /// Constructs a [ColorsApp] widget
  const ColorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colors generation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorsGeneratorScreen(),
    );
  }
}

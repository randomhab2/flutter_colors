import 'package:flutter/material.dart';
import 'package:flutter_colors/src/utils/colors_util.dart';

/// A StatefulWidget for generating colorful screen
class ColorsGeneratorScreen extends StatefulWidget {
  /// Constructs a [ColorsGeneratorScreen] widget
  const ColorsGeneratorScreen({super.key});

  @override
  State<ColorsGeneratorScreen> createState() => _ColorsGeneratorScreenState();
}

class _ColorsGeneratorScreenState extends State<ColorsGeneratorScreen>
    with SingleTickerProviderStateMixin {
  static const _defaultColor = Colors.transparent;
  Color? _textColor;
  late AnimationController _animationController;
  Animation<Color?>? _backgroundColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _changeBackgroundColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colorful App'),
      ),
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: AnimatedBuilder(
          animation: _backgroundColorAnimation ??
              const AlwaysStoppedAnimation<Color>(_defaultColor),
          builder: (context, child) {
            return Container(
              color: _backgroundColorAnimation?.value ?? _defaultColor,
              alignment: Alignment.center,
              child: Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _changeBackgroundColor() {
    final randomColor = ColorsUtil.getRandomColor();
    _textColor = ColorsUtil.computeTextColor(randomColor);
    _backgroundColorAnimation = ColorTween(
      begin: _backgroundColorAnimation?.value ?? _defaultColor,
      end: randomColor,
    ).animate(_animationController);

    _animateBackgroundColor();
  }

  void _animateBackgroundColor() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

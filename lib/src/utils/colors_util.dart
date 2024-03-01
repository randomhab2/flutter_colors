import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Utility for operations with colors
class ColorsUtil {
  /// Generates a color with full opacity from the 16777216 colors available in
  /// the RGB color space
  static Color getRandomColor() {
    final randomDouble = math.Random().nextDouble();
    final colorValue = (randomDouble * 0xFFFFFF).toInt();

    return Color(colorValue).withOpacity(1.0);
  }

  /// Computes the text color based on the background color's luminance.
  ///
  /// [color]: The background color for which the text color
  /// needs to be determined.
  static Color computeTextColor(Color color) {
    const brightnessLevel = 0.5;

    return color.computeLuminance() >= brightnessLevel
        ? Colors.black
        : Colors.white;
  }
}

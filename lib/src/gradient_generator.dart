//group 5
//k22-4230

import 'package:flutter/material.dart';
import 'dart:math';

/// Enum to define gradient types
enum GradientType {
  linear,
  radial,
  sweep,
}

/// A utility class for generating random, vibrant gradients.
///
/// This class provides several methods to generate random gradients with
/// customizable colors, brightness, and saturation levels.
class RandomGradientGenerator {
  static final Random _random = Random();

  /// Generates a random color with optional brightness and saturation control.
  ///
  /// Parameters:
  /// - [brightness]: Controls the lightness of the color (0.0 to 1.0).
  ///   Higher values produce lighter colors. Defaults to 0.6.
  /// - [saturation]: Controls the saturation of the color (0.0 to 1.0).
  ///   Higher values produce more vivid colors. Defaults to 0.8.
  ///
  /// Returns: A random [Color] with the specified characteristics.
  static Color generateRandomColor({
    double brightness = 0.6,
    double saturation = 0.8,
  }) {
    assert(brightness >= 0.0 && brightness <= 1.0,
        'brightness must be between 0.0 and 1.0');
    assert(saturation >= 0.0 && saturation <= 1.0,
        'saturation must be between 0.0 and 1.0');

    // Generate random HSV values
    final hue = _random.nextDouble() * 360.0; // 0 to 360 degrees
    final sat = saturation * (0.5 + _random.nextDouble() * 0.5); // Variation in saturation
    final value = brightness * (0.5 + _random.nextDouble() * 0.5); // Variation in value

    // Convert HSV to RGB
    return HSVColor.fromAHSV(1.0, hue, sat, value).toColor();
  }

  /// Generates a linear gradient with random colors.
  ///
  /// Parameters:
  /// - [colorCount]: Number of colors in the gradient (minimum 2). Defaults to 2.
  /// - [begin]: Starting point of the gradient. Defaults to [Alignment.topLeft].
  /// - [end]: Ending point of the gradient. Defaults to [Alignment.bottomRight].
  /// - [brightness]: Controls the lightness of generated colors. Defaults to 0.6.
  /// - [saturation]: Controls the saturation of generated colors. Defaults to 0.8.
  ///
  /// Returns: A [LinearGradient] with random colors.
  static LinearGradient generateLinearGradient({
    int colorCount = 2,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
    double brightness = 0.6,
    double saturation = 0.8,
  }) {
    assert(colorCount >= 2, 'colorCount must be at least 2');

    final colors = <Color>[];
    for (int i = 0; i < colorCount; i++) {
      colors.add(
        generateRandomColor(brightness: brightness, saturation: saturation),
      );
    }

    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
    );
  }

  /// Generates a radial gradient with random colors.
  ///
  /// Parameters:
  /// - [colorCount]: Number of colors in the gradient (minimum 2). Defaults to 2.
  /// - [center]: Center point of the gradient. Defaults to [Alignment.center].
  /// - [radius]: Radius of the gradient. Defaults to 0.5.
  /// - [brightness]: Controls the lightness of generated colors. Defaults to 0.6.
  /// - [saturation]: Controls the saturation of generated colors. Defaults to 0.8.
  ///
  /// Returns: A [RadialGradient] with random colors.
  static RadialGradient generateRadialGradient({
    int colorCount = 2,
    Alignment center = Alignment.center,
    double radius = 0.5,
    double brightness = 0.6,
    double saturation = 0.8,
  }) {
    assert(colorCount >= 2, 'colorCount must be at least 2');
    assert(radius > 0, 'radius must be greater than 0');

    final colors = <Color>[];
    for (int i = 0; i < colorCount; i++) {
      colors.add(
        generateRandomColor(brightness: brightness, saturation: saturation),
      );
    }

    return RadialGradient(
      center: center,
      radius: radius,
      colors: colors,
    );
  }

  /// Generates a sweep gradient with random colors.
  ///
  /// Parameters:
  /// - [colorCount]: Number of colors in the gradient (minimum 2). Defaults to 2.
  /// - [center]: Center point of the gradient. Defaults to [Alignment.center].
  /// - [startAngle]: Starting angle in radians. Defaults to 0.0.
  /// - [endAngle]: Ending angle in radians. Defaults to 2π.
  /// - [brightness]: Controls the lightness of generated colors. Defaults to 0.6.
  /// - [saturation]: Controls the saturation of generated colors. Defaults to 0.8.
  ///
  /// Returns: A [SweepGradient] with random colors.
  static SweepGradient generateSweepGradient({
    int colorCount = 2,
    Alignment center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = 2 * pi,
    double brightness = 0.6,
    double saturation = 0.8,
  }) {
    assert(colorCount >= 2, 'colorCount must be at least 2');

    final colors = <Color>[];
    for (int i = 0; i < colorCount; i++) {
      colors.add(
        generateRandomColor(brightness: brightness, saturation: saturation),
      );
    }

    return SweepGradient(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: colors,
    );
  }

  /// Generates a random gradient with automatic type selection.
  ///
  /// This method randomly selects a gradient type (linear, radial, or sweep)
  /// and generates a gradient of that type.
  ///
  /// Parameters:
  /// - [colorCount]: Number of colors in the gradient (minimum 2). Defaults to 3.
  /// - [brightness]: Controls the lightness of generated colors. Defaults to 0.6.
  /// - [saturation]: Controls the saturation of generated colors. Defaults to 0.8.
  ///
  /// Returns: A [Gradient] (either Linear, Radial, or Sweep) with random colors.
  static Gradient generateRandomGradient({
    int colorCount = 3,
    double brightness = 0.6,
    double saturation = 0.8,
  }) {
    final types = GradientType.values;
    final randomType = types[_random.nextInt(types.length)];

    switch (randomType) {
      case GradientType.linear:
        return generateLinearGradient(
          colorCount: colorCount,
          brightness: brightness,
          saturation: saturation,
        );
      case GradientType.radial:
        return generateRadialGradient(
          colorCount: colorCount,
          brightness: brightness,
          saturation: saturation,
        );
      case GradientType.sweep:
        return generateSweepGradient(
          colorCount: colorCount,
          brightness: brightness,
          saturation: saturation,
        );
    }
  }

  /// Generates a list of random colors.
  ///
  /// Parameters:
  /// - [count]: Number of colors to generate. Defaults to 5.
  /// - [brightness]: Controls the lightness of generated colors. Defaults to 0.6.
  /// - [saturation]: Controls the saturation of generated colors. Defaults to 0.8.
  ///
  /// Returns: A [List] of random [Color]s.
  static List<Color> generateRandomColors({
    int count = 5,
    double brightness = 0.6,
    double saturation = 0.8,
  }) {
    assert(count > 0, 'count must be greater than 0');

    final colors = <Color>[];
    for (int i = 0; i < count; i++) {
      colors.add(
        generateRandomColor(brightness: brightness, saturation: saturation),
      );
    }
    return colors;
  }
}

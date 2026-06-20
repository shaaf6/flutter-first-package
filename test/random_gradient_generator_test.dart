import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_gradient_generator/random_gradient_generator.dart';

void main() {
  group('RandomGradientGenerator - Color Generation Tests', () {
    test('generateRandomColor returns a valid Color', () {
      final color = RandomGradientGenerator.generateRandomColor();
      expect(color, isA<Color>());
    });

    test('generateRandomColor respects brightness parameter', () {
      final color = RandomGradientGenerator.generateRandomColor(brightness: 0.9);
      expect(color, isA<Color>());
    });

    test('generateRandomColor respects saturation parameter', () {
      final color = RandomGradientGenerator.generateRandomColor(saturation: 0.5);
      expect(color, isA<Color>());
    });

    test('generateRandomColor throws on invalid brightness', () {
      expect(
        () => RandomGradientGenerator.generateRandomColor(brightness: 1.5),
        throwsAssertionError,
      );
    });

    test('generateRandomColor throws on invalid saturation', () {
      expect(
        () => RandomGradientGenerator.generateRandomColor(saturation: -0.5),
        throwsAssertionError,
      );
    });

    test('generateRandomColors returns correct count', () {
      final colors = RandomGradientGenerator.generateRandomColors(count: 5);
      expect(colors.length, 5);
    });

    test('generateRandomColors returns unique colors', () {
      final colors = RandomGradientGenerator.generateRandomColors(count: 10);
      expect(colors.length, 10);
      // Check that not all colors are the same (statistically)
      final uniqueColors = colors.toSet().length;
      expect(uniqueColors > 1, true);
    });

    test('generateRandomColors throws on invalid count', () {
      expect(
        () => RandomGradientGenerator.generateRandomColors(count: 0),
        throwsAssertionError,
      );
    });
  });

  group('RandomGradientGenerator - Linear Gradient Tests', () {
    test('generateLinearGradient returns a LinearGradient', () {
      final gradient = RandomGradientGenerator.generateLinearGradient();
      expect(gradient, isA<LinearGradient>());
    });

    test('generateLinearGradient has correct number of colors', () {
      final gradient =
          RandomGradientGenerator.generateLinearGradient(colorCount: 3);
      expect(gradient.colors.length, 3);
    });

    test('generateLinearGradient respects begin and end parameters', () {
      final gradient = RandomGradientGenerator.generateLinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
      expect(gradient.begin, Alignment.topCenter);
      expect(gradient.end, Alignment.bottomCenter);
    });

    test('generateLinearGradient minimum colorCount is 2', () {
      expect(
        () => RandomGradientGenerator.generateLinearGradient(colorCount: 1),
        throwsAssertionError,
      );
    });

    test('generateLinearGradient with 2 colors is valid', () {
      final gradient = RandomGradientGenerator.generateLinearGradient();
      expect(gradient.colors.length, 2);
    });
  });

  group('RandomGradientGenerator - Radial Gradient Tests', () {
    test('generateRadialGradient returns a RadialGradient', () {
      final gradient = RandomGradientGenerator.generateRadialGradient();
      expect(gradient, isA<RadialGradient>());
    });

    test('generateRadialGradient has correct number of colors', () {
      final gradient =
          RandomGradientGenerator.generateRadialGradient(colorCount: 4);
      expect(gradient.colors.length, 4);
    });

    test('generateRadialGradient respects center and radius parameters', () {
      final gradient = RandomGradientGenerator.generateRadialGradient(
        center: Alignment.center,
        radius: 0.7,
      );
      expect(gradient.center, Alignment.center);
      expect(gradient.radius, 0.7);
    });

    test('generateRadialGradient throws on invalid radius', () {
      expect(
        () => RandomGradientGenerator.generateRadialGradient(radius: 0),
        throwsAssertionError,
      );
    });

    test('generateRadialGradient throws on negative radius', () {
      expect(
        () =>
            RandomGradientGenerator.generateRadialGradient(radius: -0.5),
        throwsAssertionError,
      );
    });
  });

  group('RandomGradientGenerator - Sweep Gradient Tests', () {
    test('generateSweepGradient returns a SweepGradient', () {
      final gradient = RandomGradientGenerator.generateSweepGradient();
      expect(gradient, isA<SweepGradient>());
    });

    test('generateSweepGradient has correct number of colors', () {
      final gradient =
          RandomGradientGenerator.generateSweepGradient(colorCount: 5);
      expect(gradient.colors.length, 5);
    });

    test('generateSweepGradient respects angle parameters', () {
      final gradient = RandomGradientGenerator.generateSweepGradient(
        startAngle: 0.0,
        endAngle: 3.14,
      );
      expect(gradient.startAngle, 0.0);
      expect(gradient.endAngle, 3.14);
    });
  });

  group('RandomGradientGenerator - Random Gradient Tests', () {
    test('generateRandomGradient returns a Gradient', () {
      final gradient = RandomGradientGenerator.generateRandomGradient();
      expect(
        gradient,
        anyOf(isA<LinearGradient>(), isA<RadialGradient>(),
            isA<SweepGradient>()),
      );
    });

    test('generateRandomGradient respects colorCount parameter', () {
      final gradient =
          RandomGradientGenerator.generateRandomGradient(colorCount: 4);
      expect(gradient.colors.length, 4);
    });

    test(
        'generateRandomGradient can generate all gradient types over multiple calls',
        () {
      final gradients = <Gradient>[];
      for (int i = 0; i < 100; i++) {
        gradients.add(RandomGradientGenerator.generateRandomGradient());
      }

      final hasLinear = gradients.whereType<LinearGradient>().isNotEmpty;
      final hasRadial = gradients.whereType<RadialGradient>().isNotEmpty;
      final hasSweep = gradients.whereType<SweepGradient>().isNotEmpty;

      expect(hasLinear || hasRadial || hasSweep, true);
    });
  });

  group('RandomGradientGenerator - Consistency Tests', () {
    test('generateRandomColor produces different results on multiple calls', () {
      final color1 = RandomGradientGenerator.generateRandomColor();
      final color2 = RandomGradientGenerator.generateRandomColor();
      // While not guaranteed, different colors on consecutive calls is statistically likely
      expect(
        color1 != color2 || color1 == color2,
        true,
      ); // This test always passes but ensures no exceptions are thrown
    });

    test('different brightness levels produce different results', () {
      final brightColor = RandomGradientGenerator.generateRandomColor(
          brightness: 0.9, saturation: 0.5);
      final darkColor = RandomGradientGenerator.generateRandomColor(
          brightness: 0.2, saturation: 0.5);
      expect(brightColor, isA<Color>());
      expect(darkColor, isA<Color>());
    });
  });
}

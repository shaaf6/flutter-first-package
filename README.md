# Random Gradient Generator

A lightweight and easy-to-use Flutter package for generating beautiful, random gradients with customizable colors, brightness, and saturation levels.

## Features

✨ **Easy-to-Use API** - Simple methods to generate gradients with minimal code
🎨 **Multiple Gradient Types** - Support for linear, radial, and sweep gradients
🌈 **Random Colors** - Generate random colors with fine-tuned brightness and saturation control
🎯 **Flexible Customization** - Control color count, brightness, saturation, and gradient direction
⚡ **Lightweight** - Minimal dependencies (only requires Flutter)
🔄 **Auto-Generate** - Randomly select gradient types for variety

## Installation

Add `random_gradient_generator` to your `pubspec.yaml`:

```yaml
dependencies:
  random_gradient_generator: ^0.0.1
```

Then run:
```bash
flutter pub get
```

## Usage

### Import the package

```dart
import 'package:random_gradient_generator/random_gradient_generator.dart';
```

### Generate a Random Color

```dart
Color randomColor = RandomGradientGenerator.generateRandomColor(
  brightness: 0.6,
  saturation: 0.8,
);
```

### Generate a Linear Gradient

```dart
LinearGradient gradient = RandomGradientGenerator.generateLinearGradient(
  colorCount: 3,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  brightness: 0.7,
  saturation: 0.85,
);

// Use it in a Container
Container(
  height: 200,
  decoration: BoxDecoration(gradient: gradient),
)
```

### Generate a Radial Gradient

```dart
RadialGradient gradient = RandomGradientGenerator.generateRadialGradient(
  colorCount: 3,
  center: Alignment.center,
  radius: 0.5,
  brightness: 0.7,
);
```

### Generate a Sweep Gradient

```dart
SweepGradient gradient = RandomGradientGenerator.generateSweepGradient(
  colorCount: 4,
  brightness: 0.6,
  saturation: 0.8,
);
```

### Generate Random Gradient (Auto Type Selection)

```dart
// Randomly selects between linear, radial, and sweep gradients
Gradient gradient = RandomGradientGenerator.generateRandomGradient(
  colorCount: 3,
  brightness: 0.65,
);
```

### Generate Color Palette

```dart
List<Color> palette = RandomGradientGenerator.generateRandomColors(
  count: 5,
  brightness: 0.6,
  saturation: 0.8,
);
```

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:random_gradient_generator/random_gradient_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LinearGradient _gradient;

  @override
  void initState() {
    super.initState();
    _generateNewGradient();
  }

  void _generateNewGradient() {
    setState(() {
      _gradient = RandomGradientGenerator.generateLinearGradient(
        colorCount: 3,
        brightness: 0.7,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Random Gradient Generator')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  gradient: _gradient,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateNewGradient,
                child: const Text('Generate New Gradient'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## API Reference

### RandomGradientGenerator

#### Static Methods

##### `generateRandomColor({double brightness = 0.6, double saturation = 0.8}) → Color`

Generates a single random color with customizable brightness and saturation.

**Parameters:**
- `brightness` (0.0 - 1.0): Controls lightness of the color. Higher values = lighter colors
- `saturation` (0.0 - 1.0): Controls vividness of the color. Higher values = more vivid colors

**Returns:** A random `Color`

---

##### `generateLinearGradient({int colorCount = 2, Alignment begin, Alignment end, double brightness = 0.6, double saturation = 0.8}) → LinearGradient`

Creates a linear gradient transitioning from one point to another.

**Parameters:**
- `colorCount` (minimum 2): Number of colors in the gradient
- `begin`: Starting alignment (default: topLeft)
- `end`: Ending alignment (default: bottomRight)
- `brightness`: Controls lightness of generated colors
- `saturation`: Controls vividness of generated colors

**Returns:** A `LinearGradient` with random colors

---

##### `generateRadialGradient({int colorCount = 2, Alignment center, double radius = 0.5, double brightness = 0.6, double saturation = 0.8}) → RadialGradient`

Creates a radial gradient emanating from a center point.

**Parameters:**
- `colorCount` (minimum 2): Number of colors in the gradient
- `center`: Center point of the gradient (default: center)
- `radius`: Radius of the gradient (default: 0.5)
- `brightness`: Controls lightness of generated colors
- `saturation`: Controls vividness of generated colors

**Returns:** A `RadialGradient` with random colors

---

##### `generateSweepGradient({int colorCount = 2, Alignment center, double startAngle = 0.0, double endAngle = 2π, double brightness = 0.6, double saturation = 0.8}) → SweepGradient`

Creates a sweep gradient that rotates around a center point.

**Parameters:**
- `colorCount` (minimum 2): Number of colors in the gradient
- `center`: Center point of the gradient (default: center)
- `startAngle`: Starting angle in radians (default: 0.0)
- `endAngle`: Ending angle in radians (default: 2π)
- `brightness`: Controls lightness of generated colors
- `saturation`: Controls vividness of generated colors

**Returns:** A `SweepGradient` with random colors

---

##### `generateRandomGradient({int colorCount = 3, double brightness = 0.6, double saturation = 0.8}) → Gradient`

Randomly selects a gradient type and generates a gradient of that type.

**Parameters:**
- `colorCount` (minimum 2): Number of colors in the gradient
- `brightness`: Controls lightness of generated colors
- `saturation`: Controls vividness of generated colors

**Returns:** A random `Gradient` (LinearGradient, RadialGradient, or SweepGradient)

---

##### `generateRandomColors({int count = 5, double brightness = 0.6, double saturation = 0.8}) → List<Color>`

Generates a list of random colors, useful for creating color palettes.

**Parameters:**
- `count`: Number of colors to generate
- `brightness`: Controls lightness of generated colors
- `saturation`: Controls vividness of generated colors

**Returns:** A `List<Color>` of random colors

## UI Showcase

### Linear Gradient
```
┌─────────────────────────┐
│ ▓▓▓░░░░░░░░░░░░░░░░░░░ │
│ ▓▓▓░░░░░░░░░░░░░░░░░░░ │
│ ▓▓▓░░░░░░░░░░░░░░░░░░░ │
│ ▓▓▓░░░░░░░░░░░░░░░░░░░ │
└─────────────────────────┘
Linear gradient from top-left to bottom-right
```

### Radial Gradient
```
┌─────────────────────────┐
│     ░░░░░░░░░░░░░     │
│   ░░░░░░░░░░░░░░░░░   │
│  ░░░░░▓▓▓▓▓▓▓▓░░░░░  │
│   ░░░░░░░░░░░░░░░░░   │
│     ░░░░░░░░░░░░░     │
└─────────────────────────┘
Radial gradient emanating from center
```

### Sweep Gradient
```
┌─────────────────────────┐
│ ░░░▓▓▓▓▓▓▓▓▓▓░░░░░░░░ │
│ ░░▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░ │
│ ░░▓▓▓░░░░░░▓▓▓░░░░░░░ │
│ ░░▓▓░░░░░░░░▓▓▓░░░░░░ │
│ ░░░▓▓▓▓▓▓▓▓▓▓░░░░░░░░ │
└─────────────────────────┘
Sweep gradient rotating around center
```

## Examples

### Background Gradient
```dart
Scaffold(
  body: Container(
    decoration: BoxDecoration(
      gradient: RandomGradientGenerator.generateLinearGradient(
        colorCount: 2,
      ),
    ),
    child: Center(
      child: Text('Hello World'),
    ),
  ),
)
```

### Animated Gradient Background
```dart
class AnimatedGradientWidget extends StatefulWidget {
  @override
  State<AnimatedGradientWidget> createState() => _AnimatedGradientWidgetState();
}

class _AnimatedGradientWidgetState extends State<AnimatedGradientWidget> {
  late LinearGradient _gradient;

  @override
  void initState() {
    super.initState();
    _gradient = RandomGradientGenerator.generateLinearGradient();
  }

  void _updateGradient() {
    setState(() {
      _gradient = RandomGradientGenerator.generateLinearGradient();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _updateGradient,
      child: Container(
        decoration: BoxDecoration(gradient: _gradient),
      ),
    );
  }
}
```

### Gradient Buttons
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  ),
  onPressed: () {},
  child: Container(
    decoration: BoxDecoration(
      gradient: RandomGradientGenerator.generateLinearGradient(colorCount: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.all(16),
    child: Text('Gradient Button'),
  ),
)
```

## Parameters Explanation

### Brightness
- **Range:** 0.0 - 1.0
- **0.0:** Very dark colors
- **0.5:** Medium brightness (default good for contrast)
- **1.0:** Very light colors

### Saturation
- **Range:** 0.0 - 1.0
- **0.0:** Grayscale colors
- **0.5:** Muted colors
- **0.8:** Vibrant colors (default)
- **1.0:** Maximum saturation

## Testing

Run the included test suite:

```bash
flutter test
```

The package includes comprehensive tests for:
- Color generation
- Gradient generation (linear, radial, sweep)
- Random gradient auto-type selection
- Parameter validation
- Color palette generation

## Troubleshooting

### Gradient appears too dark or too light
Adjust the `brightness` parameter:
```dart
RandomGradientGenerator.generateLinearGradient(
  brightness: 0.8,  // Lighter
  // or
  brightness: 0.4,  // Darker
)
```

### Colors appear dull
Increase the `saturation` parameter:
```dart
RandomGradientGenerator.generateRandomColor(
  saturation: 0.95,  // More vibrant
)
```

### Need specific color scheme
Generate multiple colors and filter:
```dart
List<Color> colors = RandomGradientGenerator.generateRandomColors(
  count: 10,
  brightness: 0.7,
  saturation: 0.9,
);
```

## Contributing

Contributions are welcome! Feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues, questions, or suggestions, please open an issue on [GitHub](https://github.com/yourusername/random_gradient_generator).

---

**Note:** This is a Dart-only package (not a plugin). It generates gradients using Flutter's built-in gradient classes without requiring any native code or platform-specific implementations.

```dart
const like = 'sample';
```

## Additional information

### Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Issues & Feedback

Found a bug or have a feature request? Please open an issue on [GitHub Issues](https://github.com/yourusername/random_gradient_generator/issues).

**Response Time:** We aim to respond to issues within 48 hours.

### Getting Help

- Check the [Troubleshooting](#troubleshooting) section above
- Review [Usage](#usage) examples
- Check existing [GitHub Issues](https://github.com/yourusername/random_gradient_generator/issues)
- Read the complete [API Reference](#api-reference)

### Package Information

- **Repository:** [GitHub](https://github.com/yourusername/random_gradient_generator)
- **Issue Tracker:** [GitHub Issues](https://github.com/yourusername/random_gradient_generator/issues)
- **License:** MIT
- **Author:** Your Name

### Changelog

See [CHANGELOG.md](https://github.com/yourusername/random_gradient_generator/blob/main/CHANGELOG.md) for version history and updates.

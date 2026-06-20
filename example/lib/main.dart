import 'package:flutter/material.dart';
import 'package:random_gradient_generator/random_gradient_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Gradient Generator Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GradientShowcasePage(),
    );
  }
}

class GradientShowcasePage extends StatefulWidget {
  const GradientShowcasePage({super.key});

  @override
  State<GradientShowcasePage> createState() => _GradientShowcasePageState();
}

class _GradientShowcasePageState extends State<GradientShowcasePage> {
  late LinearGradient _linearGradient;
  late RadialGradient _radialGradient;
  late SweepGradient _sweepGradient;
  late Gradient _randomGradient;
  late List<Color> _colorPalette;

  @override
  void initState() {
    super.initState();
    _generateGradients();
  }

  void _generateGradients() {
    setState(() {
      _linearGradient = RandomGradientGenerator.generateLinearGradient(
        colorCount: 3,
        brightness: 0.7,
        saturation: 0.85,
      );
      _radialGradient = RandomGradientGenerator.generateRadialGradient(
        colorCount: 3,
        brightness: 0.7,
        saturation: 0.85,
      );
      _sweepGradient = RandomGradientGenerator.generateSweepGradient(
        colorCount: 4,
        brightness: 0.7,
        saturation: 0.85,
      );
      _randomGradient = RandomGradientGenerator.generateRandomGradient(
        colorCount: 3,
        brightness: 0.65,
        saturation: 0.8,
      );
      _colorPalette = RandomGradientGenerator.generateRandomColors(
        count: 5,
        brightness: 0.6,
        saturation: 0.8,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Gradient Generator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              const Text(
                'Gradient Showcase',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Linear Gradient
              _buildGradientCard(
                title: 'Linear Gradient',
                gradient: _linearGradient,
                description: 'A gradient that transitions linearly across a plane.',
              ),
              const SizedBox(height: 16),

              // Radial Gradient
              _buildGradientCard(
                title: 'Radial Gradient',
                gradient: _radialGradient,
                description: 'A gradient that radiates from a center point.',
              ),
              const SizedBox(height: 16),

              // Sweep Gradient
              _buildGradientCard(
                title: 'Sweep Gradient',
                gradient: _sweepGradient,
                description: 'A gradient that sweeps in an angular direction.',
              ),
              const SizedBox(height: 16),

              // Random Gradient
              _buildGradientCard(
                title: 'Random Gradient',
                gradient: _randomGradient,
                description: 'A randomly selected gradient type.',
              ),
              const SizedBox(height: 20),

              // Color Palette
              const Text(
                'Generated Color Palette',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _colorPalette
                    .map(
                      (color) => Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),

              // Refresh Button
              ElevatedButton.icon(
                onPressed: _generateGradients,
                icon: const Icon(Icons.refresh),
                label: const Text('Generate New Gradients'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Code Example
              _buildCodeExample(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientCard({
    required String title,
    required Gradient gradient,
    required String description,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeExample() {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Usage Examples',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            _buildCodeSnippet(
              'Linear Gradient',
              '''
var gradient = RandomGradientGenerator.generateLinearGradient(
  colorCount: 3,
  brightness: 0.7,
);''',
            ),
            const SizedBox(height: 12),
            _buildCodeSnippet(
              'Single Random Color',
              '''
var color = RandomGradientGenerator.generateRandomColor(
  brightness: 0.6,
  saturation: 0.8,
);''',
            ),
            const SizedBox(height: 12),
            _buildCodeSnippet(
              'Random Gradient (Auto Type)',
              '''
var gradient = RandomGradientGenerator.generateRandomGradient(
  colorCount: 3,
);''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeSnippet(String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            code,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white70,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: CylinderSurfaceAreaCalculator(),
    debugShowCheckedModeBanner: false,
  ));
}

class CylinderSurfaceAreaCalculator extends StatefulWidget {
  const CylinderSurfaceAreaCalculator({Key? key}) : super(key: key);

  @override
  _CylinderSurfaceAreaCalculatorState createState() =>
      _CylinderSurfaceAreaCalculatorState();
}

class _CylinderSurfaceAreaCalculatorState
    extends State<CylinderSurfaceAreaCalculator> {
  final TextEditingController radiusController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double? surfaceArea;

  void calculateSurfaceArea() {
    final double? radius = double.tryParse(radiusController.text);
    final double? height = double.tryParse(heightController.text);

    if (radius != null && height != null) {
      setState(() {
        surfaceArea = 2 * pi * radius * (radius + height);
      });
    } else {
      setState(() {
        surfaceArea = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surface Area of a Cylinder'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter radius (r)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter height (h)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSurfaceArea,
              child: const Text('Calculate Surface Area'),
            ),
            const SizedBox(height: 20),
            Text(
              surfaceArea == null
                  ? 'Enter valid radius and height'
                  : 'Surface Area = ${surfaceArea!.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

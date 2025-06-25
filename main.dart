import 'package:flutter/material.dart';

import 'DISCOUNT.dart';
import 'fibonacci.dart';

void main() {
  runApp(FibonacciApp());
}

class FibonacciApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Series',
      home: DiscountCalculator(),
    );
  }
}


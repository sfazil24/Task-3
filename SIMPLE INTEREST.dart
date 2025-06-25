import 'package:flutter/material.dart';

void main() => runApp(SimpleInterestApp());

class SimpleInterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest Calculator 💰',
      home: InterestCalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InterestCalculatorScreen extends StatelessWidget {
  final double principal = 5000;
  final double rate = 5;
  final int time = 3;

  double calculateSimpleInterest(double p, double r, int t) {
    return (p * r * t) / 100;
  }

  @override
  Widget build(BuildContext context) {
    double interest = calculateSimpleInterest(principal, rate, time);
    double totalAmount = principal + interest;

    return Scaffold(
      appBar: AppBar(title: Text('💰 Simple Interest Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Scenario:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Rahul invested ₹$principal at $rate% for $time years.'),
                SizedBox(height: 20),
                Text('Simple Interest: ₹${interest.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, color: Colors.green)),
                SizedBox(height: 10),
                Text('Total Amount After Maturity: ₹${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

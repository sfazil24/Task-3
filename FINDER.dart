import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FactorFinder(),
    debugShowCheckedModeBanner: false,
  ));
}

class FactorFinder extends StatelessWidget {
  const FactorFinder({super.key});

  // Function to find factors of a given number
  List<int> getFactors(int number) {
    List<int> factors = [];
    for (int i = 1; i <= number; i++) {
      if (number % i == 0) {
        factors.add(i);
      }
    }
    return factors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factor Finder 🏗️'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          int number = index + 1;
          List<int> factors = getFactors(number);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            elevation: 3,
            child: ListTile(
              title: Text(
                'Number: $number',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Factors: ${factors.join(', ')}'),
            ),
          );
        },
      ),
    );
  }
}

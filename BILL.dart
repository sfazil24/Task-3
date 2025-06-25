import 'package:flutter/material.dart';


class BillCalculatorScreen extends StatelessWidget {
  double calculateBill(int units) {
    double bill = 0;

    if (units <= 100) {
      bill = units * 3;
    } else if (units <= 200) {
      bill = (100 * 3) + ((units - 100) * 5);
    } else if (units <= 300) {
      bill = (100 * 3) + (100 * 5) + ((units - 200) * 7);
    } else {
      bill = (100 * 3) + (100 * 5) + (100 * 7) + ((units - 300) * 10);
    }

    return bill;
  }

  @override
  Widget build(BuildContext context) {
    int priyaUnits = 250;
    int raviUnits = 320;

    double priyaBill = calculateBill(priyaUnits);
    double raviBill = calculateBill(raviUnits);

    return Scaffold(
      appBar: AppBar(title: Text('🔟 Electricity Bill Calculator ⚡')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildBillCard('Priya', priyaUnits, priyaBill),
            SizedBox(height: 20),
            buildBillCard('Ravi', raviUnits, raviBill),
          ],
        ),
      ),
    );
  }

  Widget buildBillCard(String name, int units, double billAmount) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(Icons.bolt, color: Colors.orange),
        title: Text('$name\'s Electricity Usage'),
        subtitle: Text('Units Consumed: $units'),
        trailing: Text(
          '₹${billAmount.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}

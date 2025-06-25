import 'package:flutter/material.dart';

class DiscountCalculator extends StatefulWidget {
  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  final TextEditingController _priceController = TextEditingController();
  String _result = '';

  void _calculateDiscount() {
    double? price = double.tryParse(_priceController.text);
    if (price == null || price <= 0) {
      setState(() {
        _result = 'Please enter a valid price.';
      });
      return;
    }

    double discountRate = 0;

    if (price < 10000) {
      discountRate = 5;
    } else if (price <= 30000) {
      discountRate = 10;
    } else if (price <= 60000) {
      discountRate = 15;
    } else {
      discountRate = 20;
    }

    double discount = price * discountRate / 100;
    double finalAmount = price - discount;

    setState(() {
      _result = 'Original Price: ₹${price.toStringAsFixed(2)}\n'
          'Discount: $discountRate% (₹${discount.toStringAsFixed(2)})\n'
          'Final Price: ₹${finalAmount.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🏷️ Discount Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter TV Price (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateDiscount,
              child: Text('Calculate Discount'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

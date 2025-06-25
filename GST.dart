import 'package:flutter/material.dart';

void main() => runApp(HotelGSTApp());

class HotelGSTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel GST Calculator',
      home: HotelGSTScreen(),
    );
  }
}

class HotelGSTScreen extends StatefulWidget {
  @override
  _HotelGSTScreenState createState() => _HotelGSTScreenState();
}

class _HotelGSTScreenState extends State<HotelGSTScreen> {
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _nightsController = TextEditingController();

  double _gstRate = 0.0;
  double _totalAmount = 0.0;
  String _result = '';

  void _calculateGST() {
    double? rate = double.tryParse(_rateController.text);
    int? nights = int.tryParse(_nightsController.text);

    if (rate == null || nights == null || rate < 0 || nights < 0) {
      setState(() {
        _result = 'Please enter valid inputs.';
      });
      return;
    }

    // Determine GST rate based on tariff per night
    if (rate <= 1000) {
      _gstRate = 0;
    } else if (rate <= 7500) {
      _gstRate = 12;
    } else {
      _gstRate = 18;
    }

    double subtotal = rate * nights;
    double gstAmount = subtotal * (_gstRate / 100);
    _totalAmount = subtotal + gstAmount;

    setState(() {
      _result =
      'Room Rate: ₹$rate x $nights nights = ₹${subtotal.toStringAsFixed(2)}\n'
          'GST Rate: $_gstRate%\n'
          'GST Amount: ₹${gstAmount.toStringAsFixed(2)}\n'
          'Total Amount: ₹${_totalAmount.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotel Bill GST Calculator 🏨')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room Tariff per Night (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _nightsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Nights',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateGST,
              child: Text('Calculate Total Bill'),
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

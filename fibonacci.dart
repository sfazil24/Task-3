import 'package:flutter/material.dart';

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  final TextEditingController _controller = TextEditingController();
  List<int> _fibonacciList = [];

  void _generateFibonacci(int n) {
    List<int> list = [];
    int a = 0, b = 1;

    for (int i = 0; i < n; i++) {
      list.add(a);
      int temp = a + b;
      a = b;
      b = temp;
    }

    setState(() {
      _fibonacciList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fibonacci Series 🔢')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter N (number of terms)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int? n = int.tryParse(_controller.text);
                if (n != null && n > 0) {
                  _generateFibonacci(n);
                }
              },
              child: Text('Generate Fibonacci Series'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _fibonacciList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Term ${index + 1}: ${_fibonacciList[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





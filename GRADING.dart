import 'package:flutter/material.dart';


class GradeScreen extends StatefulWidget {
  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  final TextEditingController _marksController = TextEditingController();
  String _gradeResult = '';

  void _calculateGrade() {
    final String input = _marksController.text;
    final int? marks = int.tryParse(input);

    if (marks == null || marks < 0 || marks > 100) {
      setState(() {
        _gradeResult = '❌ Please enter valid marks between 0 and 100.';
      });
      return;
    }

    String grade;
    if (marks >= 90) {
      grade = 'A';
    } else if (marks >= 80) {
      grade = 'B';
    } else if (marks >= 70) {
      grade = 'C';
    } else if (marks >= 60) {
      grade = 'D';
    } else {
      grade = 'Fail';
    }

    setState(() {
      _gradeResult = '🎓 Grade: $grade';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grading System 🎓')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _marksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter student marks',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateGrade,
              child: const Text('Calculate Grade'),
            ),
            const SizedBox(height: 20),
            Text(
              _gradeResult,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

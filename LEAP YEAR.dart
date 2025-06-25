import 'package:flutter/material.dart';

void main() {
  runApp(LeapYearCheckerApp());
}

class LeapYearCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Year Checker',
      home: LeapYearScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LeapYearScreen extends StatelessWidget {
  // Function to determine if a year is a leap year
  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  // Generate list of years with leap year labels
  List<String> getYearList() {
    List<String> years = [];
    for (int year = 2000; year <= 2050; year++) {
      if (isLeapYear(year)) {
        years.add('$year ➤ Leap Year');
      } else {
        years.add('$year');
      }
    }
    return years;
  }

  @override
  Widget build(BuildContext context) {
    List<String> yearList = getYearList();

    return Scaffold(
      appBar: AppBar(
        title: Text('📅 Leap Year Checker (2000–2050)'),
      ),
      body: ListView.builder(
        itemCount: yearList.length,
        itemBuilder: (context, index) {
          final isLeap = yearList[index].contains('Leap Year');
          return ListTile(
            title: Text(
              yearList[index],
              style: TextStyle(
                fontWeight: isLeap ? FontWeight.bold : FontWeight.normal,
                color: isLeap ? Colors.green : Colors.black,
              ),
            ),
            leading: Icon(
              isLeap ? Icons.check_circle : Icons.calendar_today,
              color: isLeap ? Colors.green : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

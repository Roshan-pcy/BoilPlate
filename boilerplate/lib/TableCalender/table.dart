import 'package:flutter/material.dart';
import 'package:flutter_flip_clock/flutter_flip_clock.dart';
import 'package:table_calendar/table_calendar.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableState();
}

class _TableState extends State<TableScreen> {
  final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
          FlipPanel.builder(
            itemBuilder: (context, index) => Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                'hello ${digits[index]}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.white),
              ),
            ),
            itemsCount: digits.length,
            period: const Duration(milliseconds: 1000),
            loop: 1,
          )
        ],
      ),
    );
  }
}

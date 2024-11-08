import 'package:flutter/material.dart';

class DayCheckScreen extends StatefulWidget {
  @override
  _DayCheckScreenState createState() => _DayCheckScreenState();
}

class _DayCheckScreenState extends State<DayCheckScreen> {
  String _result = "";

  final List<String> days = [
    "",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  void _showDay(int day) {
    setState(() {
      _result =
          days[day]; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day Check"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _result,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(1),
                const SizedBox(width: 10),
                _buildButton(5),
                const SizedBox(width: 10),
                _buildButton(2),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(6),
                const SizedBox(width: 10),
                _buildButton(3),
                const SizedBox(width: 10),
                _buildButton(7),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int day) {
    return ElevatedButton(
      onPressed: () => _showDay(day),
      child: Text('$day',
          style: const TextStyle(fontSize: 24, color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(16),
        minimumSize: const Size(80, 80),
      ),
    );
  }
}

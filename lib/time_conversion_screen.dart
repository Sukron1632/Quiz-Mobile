import 'package:flutter/material.dart';

class TimeConversionScreen extends StatefulWidget {
  @override
  _TimeConversionScreenState createState() => _TimeConversionScreenState();
}

class _TimeConversionScreenState extends State<TimeConversionScreen> {
  final TextEditingController _inputTimeController = TextEditingController();
  String _leftZone = "WIB";
  String _rightZone = "WIT";
  String _convertedTime = "";

  void _convertTime() {
    try {
      List<String> timeParts = _inputTimeController.text.split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        setState(() {
          _convertedTime = "Invalid time format";
        });
        return;
      }

      int convertedHour = hour;
      if (_leftZone == "WIB" && _rightZone == "WITA") {
        convertedHour += 1;
      } else if (_leftZone == "WIB" && _rightZone == "WIT") {
        convertedHour += 2;
      } else if (_leftZone == "WITA" && _rightZone == "WIB") {
        convertedHour -= 1;
      } else if (_leftZone == "WITA" && _rightZone == "WIT") {
        convertedHour += 1;
      } else if (_leftZone == "WIT" && _rightZone == "WIB") {
        convertedHour -= 2;
      } else if (_leftZone == "WIT" && _rightZone == "WITA") {
        convertedHour -= 1;
      }

      if (convertedHour < 0) convertedHour += 24;
      if (convertedHour >= 24) convertedHour -= 24;

      setState(() {
        _convertedTime = "${convertedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
      });
    } catch (e) {
      setState(() {
        _convertedTime = "Invalid input. Use HH:MM format";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Time Conversion"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeInputColumn(),
                  const SizedBox(width: 20),
                  _buildConvertedTimeColumn(),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertTime,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  backgroundColor: Colors.blue
                ),
                child: const Text("Convert Time"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeInputColumn() {
    return Column(
      children: [
        DropdownButton<String>(
          value: _leftZone,
          items: const ["WIB", "WITA", "WIT"].map((zone) {
            return DropdownMenuItem(value: zone, child: Text(zone));
          }).toList(),
          onChanged: (zone) {
            setState(() {
              _leftZone = zone!;
            });
          },
        ),
        const SizedBox(height: 10),
        Container(
          width: 150,
          child: TextField(
            controller: _inputTimeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Enter Time",
              hintText: "HH:MM",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConvertedTimeColumn() {
    return Column(
      children: [
        DropdownButton<String>(
          value: _rightZone,
          items: const ["WIB", "WITA", "WIT"].map((zone) {
            return DropdownMenuItem(value: zone, child: Text(zone));
          }).toList(),
          onChanged: (zone) {
            setState(() {
              _rightZone = zone!;
            });
          },
        ),
        const SizedBox(height: 10),
        Container(
          width: 150,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _convertedTime,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

class PyramidScreen extends StatefulWidget {
  @override
  _PyramidScreenState createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  void _calculateVolumeAndSurfaceArea() {
    double base = double.tryParse(_baseController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;

    if (base > 0 && height > 0) {
      double slantHeight = sqrt(pow(base / 2, 2) + pow(height, 2));
      double volume = (1 / 3) * pow(base, 2) * height;
      double surfaceArea = pow(base, 2) + 2 * base * slantHeight;

      setState(() {
        _result =
            "Volume: ${volume.toStringAsFixed(2)}\nLuas Permukaan: ${surfaceArea.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        _result = "Please enter valid values for both base and height.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pyramid Calculations"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Piramida\n(Limas Segiempat)",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Panjang Alas (Base)",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tinggi Limas (Height)",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateVolumeAndSurfaceArea,
              child: const Text("Hitung Volume dan Luas Permukaan", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

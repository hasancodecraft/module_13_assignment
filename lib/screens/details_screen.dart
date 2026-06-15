import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int counterValue;

  const DetailsScreen({super.key, required this.counterValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdf5ff),
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Color(0xfffdf5ff),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received counter value', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              counterValue.toString(),
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

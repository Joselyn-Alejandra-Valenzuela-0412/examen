import 'package:flutter/material.dart';

class WidTres extends StatelessWidget {
  const WidTres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc82663), // Color rosa característico
        title: const Text(
          'Widget 3',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              'Row 1',
              style: TextStyle(fontSize: 18, color: Color(0xffc82663)),
            ),
            SizedBox(height: 10),
            Text(
              'Row 2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Row 3',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              'Row 4',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Row 5',
              style: TextStyle(fontSize: 18, letterSpacing: 2.0),
            ),
            SizedBox(height: 20),
            Text(
              'Flutter Mapp',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xffc82663),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyRadialNSweepGradient extends StatelessWidget {
  const MyRadialNSweepGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gradientes Radial y Sweep',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffc82663), // Color rosa característico
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Muestra de gradientes Radial y Sweep'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade50,
              Colors.deepPurple.shade100,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                const Text(
                  'Radial Gradient',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffc82663),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                    gradient: const RadialGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green,
                        Colors.blue,
                        Colors.indigo,
                        Colors.deepPurpleAccent,
                      ],
                      stops: [0.0, 0.2, 0.4, 0.5, 0.6, 0.8, 1.0],
                      center: Alignment.center,
                      radius: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Sweep Gradient',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffc82663),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                    gradient: const SweepGradient(
                      colors: [
                        Colors.purple,
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green,
                        Colors.blue,
                        Colors.indigo,
                        Colors.deepPurpleAccent,
                      ],
                      stops: [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 0.9, 1.0],
                      center: Alignment.center,
                      startAngle: 0.0,
                      endAngle: 3.1416 * 2,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

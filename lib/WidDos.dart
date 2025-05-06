import 'package:flutter/material.dart';

class WidDos extends StatelessWidget {
  const WidDos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc82663), // Color rosa característico
        title: const Text(
          'Widget 2 ',
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
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                'Texto con estilo del Theme',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xffc82663),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}

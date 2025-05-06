import 'package:flutter/material.dart';

class WidSeis extends StatelessWidget {
  const WidSeis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc82663), // Color rosa característico
        title: const Text(
          'Widget 6',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xffc82663), // Color del botón
                foregroundColor: Colors.white, // Color del texto
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
              ),
              onPressed: () {
                // Acción al presionar el botón
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Botón presionado'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text(
                'Filled Button',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ejemplo de FilledButton',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

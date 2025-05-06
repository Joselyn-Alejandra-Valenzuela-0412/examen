import 'package:flutter/material.dart';

class MyInteractiveViewer extends StatefulWidget {
  const MyInteractiveViewer({Key? key}) : super(key: key);

  @override
  State<MyInteractiveViewer> createState() => _MyInteractiveViewerState();
}

class _MyInteractiveViewerState extends State<MyInteractiveViewer> {
  final Color _appBarColor =
      const Color(0xffc82663); // Color rosa característico
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapa Interactivo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: _appBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.zoom_out_map, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pellizca o haz doble tap para zoom'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Escala actual: ${_scale.toStringAsFixed(1)}x',
              style: TextStyle(
                fontSize: 16,
                color: _appBarColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 50,
              onInteractionUpdate: (details) {
                setState(() {
                  _scale = details.scale;
                });
              },
              child: Image.asset(
                'assets/images/bangladesh_map.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

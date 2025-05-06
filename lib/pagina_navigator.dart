import 'package:flutter/material.dart';

class MyNavigator extends StatelessWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Widgets'),
        backgroundColor: const Color(0xffc82663),
        automaticallyImplyLeading: true, // Muestra el botón de retroceso
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildWidgetButton(context, 'Widget 1', Icons.widgets),
          _buildWidgetButton(context, 'Widget 2', Icons.widgets),
          _buildWidgetButton(context, 'Widget 3', Icons.widgets),
          _buildWidgetButton(context, 'Widget 4', Icons.widgets),
          // Agrega más widgets según necesites
        ],
      ),
    );
  }

  Widget _buildWidgetButton(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffc82663),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          alignment: Alignment.centerLeft,
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          // Aquí puedes agregar la navegación a cada widget
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navegando a $title')),
          );
        },
      ),
    );
  }
}

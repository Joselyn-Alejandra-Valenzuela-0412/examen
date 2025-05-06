import 'package:flutter/material.dart';

class MyChoiceChip extends StatefulWidget {
  const MyChoiceChip({Key? key}) : super(key: key);

  @override
  State<MyChoiceChip> createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  bool _isSelected = false;
  final Color _primaryColor = const Color(0xffc82663);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selección con Chips',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: _primaryColor,
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
                  content: Text('Toca el chip para seleccionarlo'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              avatar: Icon(
                Icons.ac_unit,
                color: _isSelected ? Colors.white : _primaryColor,
              ),
              label: Text(
                _isSelected ? 'Seleccionado' : 'Seleccionar',
                style: TextStyle(
                  color: _isSelected ? Colors.white : Colors.black87,
                ),
              ),
              selected: _isSelected,
              selectedColor: _primaryColor,
              backgroundColor: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: _primaryColor.withOpacity(0.5),
                  width: 1,
                ),
              ),
              elevation: 3,
              onSelected: (newBoolValue) {
                setState(() {
                  _isSelected = newBoolValue;
                });
              },
            ),
            const SizedBox(height: 30),
            Text(
              _isSelected ? 'Estado: Activado' : 'Estado: Desactivado',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

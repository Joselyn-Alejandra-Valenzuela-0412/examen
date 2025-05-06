import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidCuatro extends StatefulWidget {
  const WidCuatro({Key? key}) : super(key: key);

  @override
  WidCuatroState createState() => WidCuatroState();
}

class WidCuatroState extends State<WidCuatro> {
  String? _currentText;
  final Color _primaryColor =
      const Color(0xffc82663); // Color rosa característico

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        title: const Text(
          'Widget 4',
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CupertinoSegmentedControl<String>(
                groupValue: _currentText,
                padding: const EdgeInsets.all(8),
                selectedColor: _primaryColor,
                borderColor: _primaryColor.withOpacity(0.3),
                pressedColor: _primaryColor.withOpacity(0.1),
                children: {
                  'Flutter': Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Flutter',
                      style: TextStyle(
                        color: _currentText == 'Flutter'
                            ? Colors.white
                            : _primaryColor,
                      ),
                    ),
                  ),
                  'Mapp': Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Mapp',
                      style: TextStyle(
                        color: _currentText == 'Mapp'
                            ? Colors.white
                            : _primaryColor,
                      ),
                    ),
                  ),
                  'YouTube': Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'YouTube',
                      style: TextStyle(
                        color: _currentText == 'YouTube'
                            ? Colors.white
                            : _primaryColor,
                      ),
                    ),
                  ),
                },
                onValueChanged: (String value) {
                  setState(() {
                    _currentText = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _currentText != null
                  ? Text(
                      _currentText!,
                      key: ValueKey<String>(_currentText!),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: _primaryColor,
                      ),
                    )
                  : const SizedBox(height: 60),
            ),
          ],
        ),
      ),
    );
  }
}

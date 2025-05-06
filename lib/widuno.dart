import 'package:flutter/material.dart';

class WidUno extends StatefulWidget {
  const WidUno({Key? key}) : super(key: key);

  @override
  WidUnoState createState() => WidUnoState();
}

class WidUnoState extends State<WidUno> {
  bool _isFlat = true;
  final Color _appBarColor = const Color(0xffc82663);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appBarColor,
        title: const Text(
          'Widget 16 - Efecto de Elevación',
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
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _isFlat ? 0 : 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              child: const SizedBox(
                height: 150.0,
                width: 150.0,
                child: Icon(
                  Icons.android_outlined,
                  size: 60,
                  color: Color(0xffc82663),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _appBarColor,
                minimumSize: const Size(120, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Toggle Elevación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                setState(() {
                  _isFlat = !_isFlat;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

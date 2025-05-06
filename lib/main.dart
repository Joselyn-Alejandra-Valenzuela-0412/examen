import 'package:flutter/material.dart';
import 'principal.dart';
import 'widuno.dart';
import 'WidDos.dart';
import 'widtres.dart';
import 'widcuatro.dart';
import 'widcinco.dart';
import 'widseis.dart';

void main() => runApp(MiRutas());

class MiRutas extends StatelessWidget {
  const MiRutas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas entre Widgets',
      routes: {
        '/': (context) => const Principal(), // Widget principal
        '/widget1': (context) => const WidUno(),
        '/widget2': (context) => const WidDos(),
        '/widget3': (context) => const WidTres(),
        '/widget4': (context) => const WidCuatro(),
        '/widget5': (context) => const WidCinco(),
        '/widget6': (context) => const WidSeis(),
      },
    );
  }
}

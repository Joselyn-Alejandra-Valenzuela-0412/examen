import 'package:flutter/material.dart';
import 'principal.dart';
import 'pagina_singlechild_scroll.dart';
import 'pagina_pageview.dart';
import 'pagina_animatedIcon.dart';
import 'pagina_navigator.dart';
import 'pagina_MyRadialNSweepGradient.dart';
import 'pagina_MyStepper.dart';
import 'pagina_MyChoiceChip.dart';
import 'pagina_MyInteractiveViewer.dart';

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
        '/widget1': (context) => const MySingleChildScrollView(),
        '/widget2': (context) => MyPageView(),
        '/widget3': (context) => const MyAnimatedIcon(),
        '/widget4': (context) => const MyNavigator(),
        '/widget5': (context) => const MyRadialNSweepGradient(),
        '/widget6': (context) => const MyStepper(),
        '/widget7': (context) => const MyChoiceChip(),
        '/widget8': (context) => const MyInteractiveViewer(),
      },
    );
  }
}

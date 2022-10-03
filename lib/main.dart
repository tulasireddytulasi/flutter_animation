import 'package:animated_cards/parallel_hero_widget/demo.dart';
import 'package:animated_cards/shared/lib/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static const String _pkg = "parallax_travel_cards_list";
  static String? get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: HeroCardDemo(),
    );
  }
}

import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Adwaita Icons Demo',
      home: AdwaitaIconsGrid(),
    );
  }
}

class AdwaitaIconsGrid extends StatelessWidget {
  static const _from = 0xf101;
  static const _to = 0xf330;

  static List<int> codes =
      List.generate(_to - _from + 1, (index) => index + _from);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 16,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          for (final code in codes)
            Icon(
              AdwaitaIconsData(code),
            ),
        ],
      ),
    );
  }
}

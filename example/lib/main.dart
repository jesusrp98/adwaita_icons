import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:example/icon_glyph_library.dart';
import 'package:example/icon_path_library.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'adwaita_icons',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 16,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          for (int i = 0; i < adwaitaIconPaths.length; i++)
            Row(
              children: [
                AdwaitaIcon(adwaitaIconPaths[i]),
                Divider(),
                Icon(adwaitaIconGlyphs[i])
              ],
            ),
        ],
      ),
    );
  }
}

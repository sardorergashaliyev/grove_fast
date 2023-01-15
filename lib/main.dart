import 'package:flutter/material.dart';
import 'package:grove_fast/pages/control_page.dart';
import 'package:grove_fast/style/style.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(decoration: TextDecoration.none),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Style.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ContolPage(),
    );
  }
}

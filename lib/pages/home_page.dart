import 'package:flutter/material.dart';
import 'package:grove_fast/pages/card_page.dart';
import 'package:grove_fast/pages/pesrons_page.dart';
import 'package:grove_fast/pages/products_page.dart';
import 'package:grove_fast/pages/profile_page.dart';
import 'package:grove_fast/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  List<Widget> list = [
    const ProductPage(),
    const PersonsPage(),
    const CardPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: Style.primaryColor),
        unselectedIconTheme: const IconThemeData(color: Style.greyColor),
        currentIndex: selectIndex,
        onTap: (value) {
          selectIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
    );
  }
}
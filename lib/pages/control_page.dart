import 'package:flutter/material.dart';
import 'package:grove_fast/pages/card_page.dart';
import 'package:grove_fast/pages/home_page.dart';
import 'package:grove_fast/pages/product_page.dart';
import 'package:grove_fast/pages/profile_page.dart';
import 'package:grove_fast/style/style.dart';

class ContolPage extends StatefulWidget {
  const ContolPage({Key? key}) : super(key: key);

  @override
  State<ContolPage> createState() => _ContolPageState();
}

class _ContolPageState extends State<ContolPage> {
  int selectIndex = 0;

  List<Widget> list = [
    const HomePage(),
    const ProductPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
    );
  }
}

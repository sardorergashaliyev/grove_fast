import 'package:flutter/material.dart';
import 'package:grove_fast/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/avatar.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Style.greyColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Yona\'s home',
                            style: Style.textStyleNormal(
                                size: 14, color: Style.greyColor),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Style.greyColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Image.asset(
                      'assets/active.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 39),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Hey Yona 👋🏻',
                  style: Style.textStyleBold(size: 32),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Find fresh groceries you want',
                  style: Style.textStyleBold(size: 18, color: Style.greyColor),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Style.primaryColor,
                          ),
                          labelText: ('Search fresh groceries'),
                          labelStyle: Style.textStyleNormal(
                            color: Style.mediumGreen,
                            size: 14,
                          ),
                          filled: true,
                          fillColor: Style.textInput,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Style.textInput),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Style.textInput),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Style.textInput),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                      
                          builder: (context) {
                            return Container();
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/scan_button.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 24),
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Style.lightGreen,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Image.asset(
                        'assets/background.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

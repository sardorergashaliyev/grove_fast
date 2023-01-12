import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';
import 'package:grove_fast/repositories/get_info.dart';
import 'package:grove_fast/style/style.dart';
import 'package:grove_fast/unit/horizontal_product.dart';
import 'package:grove_fast/unit/vertikal_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel?>? lifOfProduct = [];
  List<dynamic> listOfCategories = [];
  String categori = 'jewelery';
  dynamic newListProduct;

  bool isLoading = true;
  bool isHorizontal = true;

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  getInformation() async {
    isLoading = true;
    lifOfProduct = await GetInfo.getProduct();
    newListProduct = await GetInfo.getOnly(category: categori);
    listOfCategories = await GetInfo.getCotegory();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                              children: const [
                                Text('Yona\'s home'),
                                Icon(Icons.arrow_drop_down)
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
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30),
                        shrinkWrap: true,
                        itemCount: listOfCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              isLoading = true;
                              setState(() {});
                              lifOfProduct = await GetInfo.getOnly(
                                  category: listOfCategories[index].toString());
                              isLoading = false;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Style.bgCategory),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(listOfCategories[index] ?? 'asdf'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("All Product"),
                          IconButton(
                            onPressed: () {
                              isHorizontal = !isHorizontal;
                              setState(() {});
                            },
                            icon: Icon(isHorizontal ? Icons.menu : Icons.list),
                          )
                        ],
                      ),
                    ),
                    isHorizontal
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lifOfProduct?.length ?? 0,
                            itemBuilder: (context, index) {
                              return HorizontalProduct(
                                  product: lifOfProduct?[index]);
                            },
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lifOfProduct?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VerticalProduct(
                                  product: lifOfProduct?[index]),
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}

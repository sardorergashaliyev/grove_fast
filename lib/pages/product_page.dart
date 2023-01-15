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
  bool isSelected = false;
  bool isLoading = true;
  int? currentCategory;
  bool isProductLoading = false;
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

  getProductByCategory([String? title]) async {
    isProductLoading = true;
    setState(() {});
    lifOfProduct = title != null
        ? await GetInfo.getOnly(category: title)
        : await GetInfo.getProduct();
    isProductLoading = false;
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
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Categories',
                        style: Style.textStyleSemiBold(size: 18),
                      ),
                    ),
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
                              if (currentCategory == index) {
                                currentCategory = null;
                                getProductByCategory();
                              } else {
                                getProductByCategory(listOfCategories[index]);
                                currentCategory = index;
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: currentCategory == index
                                        ? Style.primaryColor
                                        : Style.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  color: currentCategory == index
                                      ? Style.mediumGreen.withOpacity(0.3)
                                      : Style.bgCategory),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(listOfCategories[index] ?? 'error'),
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
                          Text(
                            "All Product",
                            style: Style.textStyleSemiBold(size: 18),
                          ),
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
                    isProductLoading
                        ? const Center(child: CircularProgressIndicator())
                        : isHorizontal
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

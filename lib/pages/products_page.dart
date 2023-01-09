import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';
import 'package:grove_fast/repositories/get_info.dart';
import 'package:grove_fast/style/style.dart';
import 'package:grove_fast/unit/horizontal_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel?>? lifOfProduct = [];
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
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Style.bgCategory),
                              padding: const EdgeInsets.all(8),
                              child: Center(child: Text("category $index")));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
                          itemBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Placeholder(),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}

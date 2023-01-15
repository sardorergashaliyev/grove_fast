import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';
import 'package:grove_fast/pages/product_page.dart';
import 'package:grove_fast/style/style.dart';

class FakePage extends StatefulWidget {
  final ProductModel product;

  const FakePage({Key? key, required this.product}) : super(key: key);

  @override
  State<FakePage> createState() => _FakePageState();
}

class _FakePageState extends State<FakePage> {
  bool isLoading = false;

  time() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    time();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: '${widget.product.id}',
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.network(
                      widget.product.image!,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      widget.product.title!,
                      style: Style.textStyleSemiBold(size: 24),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      widget.product.description!,
                      style: Style.textStyleNormal(size: 14),
                    ),
                  ),
                  const SizedBox(height: 42),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 23),
                    child: Text(
                      '\$${widget.product.price!}',
                      style: Style.textStyleSemiBold(
                          size: 32, color: Style.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 24,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (a) => const ProductPage()),
                  //     (route) => false);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Style.darkGreen,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Style.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

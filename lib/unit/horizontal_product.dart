import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';
import 'package:grove_fast/style/style.dart';
import 'package:grove_fast/unit/custom_image.dart';
import 'package:grove_fast/unit/fake_page.dart';

class HorizontalProduct extends StatelessWidget {
  final ProductModel? product;

  const HorizontalProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Style.bgProduct),
      padding: const EdgeInsets.only(),
      margin: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      child: Hero(
        tag: '${product!.id}',
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (a) => FakePage(product: product!),
              ),
            );
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 16, bottom: 16, right: 12),
                child: CustomImageNetwork(
                  image: product?.image,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        margin: const EdgeInsets.only(),
                        child: Text(
                          product?.title ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Style.textStyleBold(size: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Style.white),
                        child: const Center(
                            child: Icon(
                          Icons.favorite,
                          size: 16,
                          color: Style.like,
                        )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 12),
                    child: Text(
                      ('\$${(product?.price ?? 0).toString()}'),
                      style: Style.textStyleSemiBold(
                        color: Style.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 0),
                        height: 41,
                        width: 53,
                        decoration: const BoxDecoration(
                          color: Style.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(23),
                            topLeft: Radius.circular(15),
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Style.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

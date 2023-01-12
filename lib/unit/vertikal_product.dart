import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';
import 'package:grove_fast/style/style.dart';
import 'package:grove_fast/unit/custom_image.dart';

class VerticalProduct extends StatelessWidget {
  final ProductModel? product;

  const VerticalProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Style.white),
      padding: const EdgeInsets.only(bottom: 10),
      // margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          CustomImageNetwork(
            image: product?.image,
            height: 80,
            width: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  product?.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text((product?.price ?? 0).toString()),
            ],
          ),
        ],
      ),
    );
  }
}

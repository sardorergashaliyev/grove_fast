import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';
import 'package:grove_fast/style/style.dart';
import 'package:grove_fast/unit/custom_image.dart';
import 'package:grove_fast/unit/fake_page.dart';

class VerticalProduct extends StatefulWidget {
  final ProductModel? product;
  final int index;

  const VerticalProduct({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  State<VerticalProduct> createState() => _VerticalProductState();
}

class _VerticalProductState extends State<VerticalProduct> {
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${widget.product!.id}',
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (a) => FakePage(product: widget.product!),
            ),
          );
        },
        child: Container(
          height: 300,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color: Style.white),
          padding: const EdgeInsets.only(bottom: 0, left: 12, right: 0),
          child: Column(
            children: [
              Stack(
                children: [
                  CustomImageNetwork(
                    image: widget.product?.image,
                    height: 80,
                    width: 180,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () async {
                        if (currentIndex == widget.index) {
                          currentIndex = null;
                        } else {
                          currentIndex;
                          currentIndex = widget.index;
                        }
                        setState(() {});
                      },
                      child: currentIndex == widget.index
                          ? Container(
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
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(left: 5),
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Style.like),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: Style.white,
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      widget.product?.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                      style: Style.textStyleBold(size: 15),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          ('\$${(widget.product?.price ?? 0).toString()}'),
                          style: Style.textStyleSemiBold(
                              size: 18, color: Style.primaryColor),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 0),
                        height: 38,
                        width: 49,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

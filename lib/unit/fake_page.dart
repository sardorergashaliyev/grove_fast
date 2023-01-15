import 'package:flutter/material.dart';
import 'package:grove_fast/model/model.dart';

class FakePage extends StatefulWidget {
  final ProductModel product;

  const FakePage({Key? key, required this.product}) : super(key: key);

  @override
  State<FakePage> createState() => _FakePageState();
}

class _FakePageState extends State<FakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
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
            Text(widget.product.title!)
          ],
        ),
      ),
    );
  }
}

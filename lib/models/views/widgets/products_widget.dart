import 'package:flutter/material.dart';
import 'package:assignment/api.dart';

class ProductsItem extends StatelessWidget {
  final Products item;
  const ProductsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Image.network(item.imageUrl.toString()),
            Expanded(
                child: Container(
              child: Column(
                children: <Widget>[
                  Text("${item.id}"),
                  Text("${item.title}"),
                  Text("${item.quantity}")
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

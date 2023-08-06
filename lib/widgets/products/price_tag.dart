import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.deepOrange,
        ),
        child: Text('\$' + price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            )),
      );

  }


}
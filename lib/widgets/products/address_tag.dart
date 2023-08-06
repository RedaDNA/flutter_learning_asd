import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String address;

  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Text(address),
    );
  }
}

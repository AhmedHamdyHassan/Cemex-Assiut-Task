import 'package:flutter/material.dart';

class CustomDataRow extends StatelessWidget {
  final Widget child1, child2;
  const CustomDataRow({Key? key, required this.child1, required this.child2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        child1,
        child2,
      ],
    );
  }
}

import 'package:appium_sample/shared/widgets/key_button.dart';
import 'package:flutter/material.dart';

class KeyRow extends StatelessWidget {
  const KeyRow({
    Key? key,
    required this.height,
    required this.keys,
  }) : super(key: key);

  final double height;
  final List<KeyButton> keys;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.14,
      padding: const EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: keys,
      ),
    );
  }
}

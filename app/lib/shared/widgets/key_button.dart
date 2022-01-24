import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  const KeyButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final VoidCallback onTap;
  final dynamic icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 28,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: icon is Widget
                ? icon
                : const Text(
                    '?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

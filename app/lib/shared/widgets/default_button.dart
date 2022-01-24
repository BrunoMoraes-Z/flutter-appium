import 'package:appium_sample/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  
  const DefaultButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.enabled = true,
    this.activeColor = activeButtonColor,
    this.inactiveColor = inactiveButtonColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool enabled;
  final Color activeColor, inactiveColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: enabled ? activeButtonColor : inactiveButtonColor,
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class CustomerActionButton extends StatelessWidget {
  const CustomerActionButton(
      {Key? key,
      required this.title,
      this.buttonSize = ButtonSize.medium,
      this.color = Colors.blue,
      required this.onTap})
      : super(key: key);

  final String title;
  final ButtonSize? buttonSize;
  final Color? color;
  final VoidCallback onTap;

  double _getButtonSize(ButtonSize buttonSize) {
    switch (buttonSize) {
      case ButtonSize.small:
        return 40;
      case ButtonSize.medium:
        return 60;
      case ButtonSize.large:
        return 80;
      default:
        return 70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: _getButtonSize(buttonSize??ButtonSize.small),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        splashColor: color != null ? color!.withOpacity(0.5) : Colors.grey,
        borderRadius: BorderRadius.circular(16.0),
        onTap: onTap,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({
    this.child,
    this.onPress,
  });

  final Widget? child;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: 145,
        decoration: BoxDecoration(
          color: Color(0xffAEC632),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 48),
          child: child,
        ),
      ),
    );
  }
}

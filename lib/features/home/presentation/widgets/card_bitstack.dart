import 'package:flutter/material.dart';

class CardBitstack extends StatelessWidget {
  const CardBitstack({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
  });
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff23242E).withOpacity(0.07),
            blurRadius: 34,
          )
        ],
        color: Colors.white,
        border: Border.all(color: Color(0xffDBE0F2)),
        borderRadius: borderRadius ?? BorderRadius.circular(17),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}

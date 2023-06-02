
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final double? side;
  final double? height;
  final double? width;
  final Widget? child;
  final String? text;
  final IconData? icon;
  final Color? foregroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? topLeftColor;
  final Color? bottomRightColor;
  final double? borderRadius;
  final double? borderRadiusTopLeft;
  final double? borderRadiusBottomLeft;
  final double? borderRadiusTopRight;
  final double? borderRadiusBottomRight;

  const CustomBox({
    Key? key,
    this.side,
    this.height,
    this.width,
    this.child,
    this.text,
    this.icon,
    this.foregroundColor,
    this.iconColor,
    this.borderColor,
    this.topLeftColor,
    this.bottomRightColor,
    this.borderRadius,
    this.borderRadiusTopLeft,
    this.borderRadiusBottomLeft,
    this.borderRadiusTopRight,
    this.borderRadiusBottomRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goodBorderRadius = ((height ?? side!) / 6);
    var borderRadiusVar = (borderRadius != null)
        ? BorderRadius.circular(borderRadius ?? goodBorderRadius)
        : BorderRadius.only(
            bottomLeft: Radius.circular(
                borderRadiusBottomLeft ?? borderRadius ?? goodBorderRadius),
            topLeft: Radius.circular(
                borderRadiusTopLeft ?? borderRadius ?? goodBorderRadius),
            topRight: Radius.circular(
                borderRadiusTopRight ?? borderRadius ?? goodBorderRadius),
            bottomRight: Radius.circular(
                borderRadiusBottomRight ?? borderRadius ?? goodBorderRadius),
          );
    return Stack(children: [
      Container(
        height: height ?? side,
        width: width ?? side,
        decoration:
            BoxDecoration(borderRadius: borderRadiusVar, color: Colors.white),
      ),
      Container(
        height: height ?? side,
        width: width ?? side,
        decoration: BoxDecoration(
          borderRadius: borderRadiusVar,
          border: Border.all(
              color: borderColor ?? Colors.orange.shade600), // Add the border
          gradient: LinearGradient(
            colors: [
              topLeftColor ?? const Color.fromARGB(255, 255, 197, 120),
              bottomRightColor ?? const Color.fromARGB(255, 255, 137, 40)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: (height ?? side!) * 3 / 5,
                    color: iconColor ?? foregroundColor ?? Colors.white,
                  ),
                if (icon != null && text != null)
                  SizedBox(
                    width: (width ?? side!) / 15,
                  ),
                if (text != null)
                  Text(
                    text ?? '',
                    style: TextStyle(
                      color: foregroundColor ?? const Color(0xff323232),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
      ),
    ]);
  }
}

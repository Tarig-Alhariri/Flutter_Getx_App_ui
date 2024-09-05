import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {this.text,
      this.fontSize,
      this.fontWeight,
      this.latterSpacing,
      this.color});

  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? latterSpacing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: latterSpacing,
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';

import 'package:cooc_project/res/color_app.dart';

import 'package:gap/gap.dart';
class ContainerButtonWidget extends StatelessWidget {
  ContainerButtonWidget(
      {super.key,
      required this.text,
      this.fontWeightText,
      this.fontSizeText,
      this.colorText,
      this.color,
      this.height,
      this.width});
  double? width;
  double? height;
  Color? color;
  String text;
  Color? colorText;
  double? fontSizeText;
  FontWeight? fontWeightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 327,
      height: height ?? 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? ColorApp.PRIMERY,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: colorText ?? ColorApp.WHITE,
            fontSize: fontSizeText ?? 16,
            fontWeight: fontWeightText ?? FontWeight.bold),
      )),
    );
  }
}

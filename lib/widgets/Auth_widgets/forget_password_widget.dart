import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  ForgetPasswordWidget(
      {super.key,
       this.fontWeight,
       this.fontSize,
       this.color,
      required this.onTap});
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Text(
          "Forget Password ?",
          style: TextStyle(
              color: color ?? Colors.amber,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w400),
        ));
  }
}

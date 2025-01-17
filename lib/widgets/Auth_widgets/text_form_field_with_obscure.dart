import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormFieldWithObscure extends StatelessWidget {
   TextFormFieldWithObscure({super.key,this.height,this.width,required this.password,required this.obscureText,required this.suffixIcon});
   double? width;
   double? height;
   TextEditingController password  =TextEditingController();
   bool obscureText = false;
   Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
        width: 327,
        height: 48,
        child: TextFormField(
          controller: password,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Password cannot be empty';
            } else if (text.length < 8) {
              return 'Password must be at least 8 characters long';
            } else {
              return null;
            }
          },
          obscureText:obscureText,
          cursorWidth: 1.0,
          cursorColor: Color(0xff8A8D91),
          cursorRadius: const Radius.circular(12),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hoverColor: Colors.green,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color(0xff8A8D91), width: 1.0),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
            hintText: "Password",
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8D91)),
          ),
        ));
  }
}

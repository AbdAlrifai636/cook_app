import 'package:flutter/material.dart';

class TextFormFieldWithoutObscure extends StatelessWidget {
   TextFormFieldWithoutObscure({super.key,this.height,this.width,required this.email});
   double? width;
   double? height;
   TextEditingController email =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 327,
        height: height?? 48,
        child: TextFormField(
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Email cannot be empty';
            } /*else if (!regex.hasMatch(text)) {
                          return 'Enter a valid email';
                        } */
            else {
              return null;
            }
          },
          controller: email,
          cursorWidth: 1.0,
          cursorColor: Color(0xff8A8D91),
          cursorRadius: const Radius.circular(12),
          decoration: InputDecoration(
            hoverColor: Colors.green,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff8A8D91), width: 1.0),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "Email or UserName",
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8D91)),
          ),
        ));
  }
}

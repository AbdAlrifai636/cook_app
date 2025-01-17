
import 'package:cooc_project/pages/auth_page.dart';
import 'package:cooc_project/res/color_app.dart';
import 'package:cooc_project/res/string_app.dart';

import 'package:flutter/material.dart';


class ChooseLangPage extends StatelessWidget {
  const ChooseLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bottomClip(height: MediaQuery.of(context).size.height * 0.90,),
          upClip(height:MediaQuery.of(context).size.height * 0.80,child: _column( arBtn: () {
            print("click");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AuthPage()));
          }, enBtn: () {}))
        ],
      ),
    );
  }
}

bottomClip({ double? height}
) {
  return ClipPath(
    clipper: BottomClipper(),
    child: Container(
      width: double.infinity,
      height:height,
      decoration: BoxDecoration(
        color: ColorApp.ORANGTWO,
      ),
    ),
  );
}

upClip({double? height,
   Widget? child}) {
  return ClipPath(
    clipper: UpClipper(),
    child: Container(
      width: double.infinity,
  height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorApp.ORANGEONE,
              ColorApp.PRIMERY,
            ]),
      ),
      child: child,

    ),
  );
}
_column({ void Function()? arBtn, void Function()? enBtn}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: 125,
        height: 120,
        child: Image(image: AssetImage(StringApp.Chef)),
      ),
      Text(
        textAlign: TextAlign.center,

        StringApp.WelcomSplash,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: ColorApp.BLACK),
      ),
      Text(
        textAlign: TextAlign.center,
        StringApp.ChooseLang,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorApp.BLACK),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: enBtn,
            color: ColorApp.BLACK,
            child: Text(
              StringApp.En,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.WHITE),
            ),
          ),
          MaterialButton(
            onPressed: arBtn,
            color: ColorApp.BLACK,
            child: Text(
              StringApp.Ar,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.WHITE),
            ),
          ),
        ],
      ),
    ],
  );
}

class UpClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height + 10, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 120);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:cooc_project/model/auth_model/log_in_model.dart';
import 'package:cooc_project/pages/choose_lang_page.dart';
import 'package:cooc_project/pages/menu_page.dart';
import 'package:cooc_project/res/color_app.dart';
import 'package:cooc_project/res/string_app.dart';
import 'package:cooc_project/services/services.dart';
import 'package:cooc_project/widgets/Auth_widgets/forget_password_widget.dart';
import 'package:cooc_project/widgets/button_widgets/container_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gap/gap.dart';
import 'package:cooc_project/widgets/Auth_widgets/text_form_field_with_obscure.dart';
import 'package:cooc_project/widgets/Auth_widgets/text_form_field_without_obscure.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController email;
  late TextEditingController password;
  late Services services;
  late bool passwordVisible;
  late RegExp regex;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    services = Services();
    regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(
                  MediaQuery.of(context).size.height * 0.40,
                ),
                TextFormFieldWithoutObscure(email: email),
                const MaxGap(10),
                TextFormFieldWithObscure(
                  password: password,
                  obscureText: !passwordVisible,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: FaIcon(passwordVisible
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash)),
                ),
                const MaxGap(20),
                ForgetPasswordWidget(onTap: () {}),
                const MaxGap(60),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final success = await services.logIn(AuthModel(
                          email: email.text, password: password.text));
                      if (success) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuPage()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Failed try again"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: ContainerButtonWidget(text: StringApp.signIn),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 60),
                  child: _richTextDoNotHaveAccount(onTap: () {}),
                )
              ],
            ),
          ),
        ),
        bottomClip(
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        upClip(
          height: MediaQuery.of(context).size.height * 0.3155,
          child: Center(
            child: _welcomeText(),
          ),
        ),
      ]),
    );
  }
}

_welcomeText() {
  return Text(
    textAlign: TextAlign.center,
    StringApp.welcomeBack,
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700, color: ColorApp.WHITE),
  );
}

_richTextDoNotHaveAccount({required void Function() onTap}) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        text: StringApp.dontHaveAccount,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff7D8FAB))),
    TextSpan(
        recognizer: TapGestureRecognizer()..onTap = onTap,
        text: StringApp.signUp,
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 16, color: ColorApp.PRIMERY))
  ]));
}

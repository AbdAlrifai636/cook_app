
import 'package:cooc_project/config/service_locater.dart';
import 'package:cooc_project/pages/auth_page.dart';
import 'package:cooc_project/pages/splash_page.dart';
import 'package:cooc_project/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Services services =Services();
  /*final token = getIt<GetStorage>().read('token');
  print(token);

  final id = getIt<GetStorage>().read('id');
  print(id);
print( await services.getAllPost(id,token));*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

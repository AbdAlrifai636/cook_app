import 'dart:developer';
import 'package:cooc_project/config/service_locater.dart';
import 'package:cooc_project/model/auth_model/log_in_model.dart';
import 'package:cooc_project/model/meal_model/meal_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Services {
  Dio dio = Dio();
  Response? response;

  Future<MealModel?> getAllPost(dynamic id, dynamic token) async {
    try {
      final response = await dio.get(
        "https://food-api-omega.vercel.app/api/v1/chef/get-chef/$id/meals",
        options: Options(
          headers: {
            'token': 'FOODAPI $token',
          },
        ),
      );

      MealModel post = MealModel.fromJson(response.data);

      return post;
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  //Auth method

  Future<bool> logIn(AuthModel authModel) async {
    try {
      response = await dio.post(
          "https://food-api-omega.vercel.app/api/v1/chef/signin",
          data: authModel.toRawJson());
      final String token = response!.data['token'];
      getIt<GetStorage>().write("token", token);
      log('Response: $token');
      final tokenDecode = JwtDecoder.decode(token);
      getIt<GetStorage>().write("id", tokenDecode['id']);
      log('id: ${tokenDecode['id']}');
      return true;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }
}

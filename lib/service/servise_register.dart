import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/model/register_model.dart';

class ServiceRegister {
  Dio dio = Dio();
  Future<UserModel?> register(AuthModel authModel) async {
    try {
      final responce = await dio.post(
          'https://socialmedia-api-v1.onrender.com/auth/register/',
          data: authModel.toJson(),
          options: Options(headers: {"Content-Type": "application/json"}));
      if (responce.statusCode == 201) {
        log('register succesfull');
        final data = UserModel.fromJson(responce.data);
        return data;
      } else {
        print('requst Faild ${responce.statusCode}');
        return null;
      }
    } catch (e) {
      print('$e');
      return null;
    }
  }

  Future<String> login(AuthModel authModel) async {
    try {
      final responce =
          await dio.post('https://socialmedia-api-v1.onrender.com/auth/login/',
              data: authModel.toJson(),
              options: Options(headers: {
                "Content-Type": "application/json",
              }));
      if (responce.statusCode == 200) {
        log('login succesfull');

        final responseData = responce.data as Map<String, dynamic>;
        String token = responseData['token'];
        String status = responseData['status'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('Token', token);
        pref.setString('Status', status);
        return status;
      } else {
        print('login Faild ${responce.statusCode}');
        return 'user not found';
      }
    } catch (e) {
      print('$e');
      return 'Something went wrong';
    }
  }

  Future<void> changePassword(String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('Token');
    final data = {"password": password};
    try {
      final responce = await dio.post(
          'https://socialmedia-api-v1.onrender.com/auth/changepassword/',
          data: jsonEncode(data),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer$token"
          }));
      if (responce.statusCode == 200) {
        log('pasword chnaged succesfull');
      } else {
        print('chnage password Faild ${responce.statusCode}');
      }
    } catch (e) {
      print('$e');
    }
  }

  Future<UserModel?> getLogUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('Token');
      if (token == null) {
        throw Exception('Token not found in SharedPreferences');
      }

      final response = await dio.get(
        'https://socialmedia-api-v1.onrender.com/auth/loggeduser/',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = UserModel.fromJson(response.data);
        return jsonData;
      } else {
        throw Exception('Failed to get logged in user: ${response.statusCode}');
      }
    } catch (erorr) {
      throw Exception('Something went wrong: $erorr');
    }
  }
  //  Future<UserModel?> getLoggedUser() async {
  //   try {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     final token = pref.getString('Token');
  //     final response = await dio.get(
  //       'https://socialmedia-api-v1.onrender.com/auth/loggeduser',
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonData = UserModel.fromJson(response.data);
  //       return jsonData;
  //     } else {
  //       throw Exception('Failed to get logged-in user: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Something went wrong: $e');
  //   }
  // }
}
// class ProfileFetching {
//     final Dio dio = Dio();
//   Future<List<Message>>fetchingData()async{
//     dio.get('')
//   }
// }

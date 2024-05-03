import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:social_media/model/register_model.dart';
import 'package:social_media/model/user_model.dart';

class UserService {
  Dio dio = Dio();
  Future<List<UserrModel>> userData() async {
    try {
      final response =
          await dio.get('https://socialmedia-api-v1.onrender.com/user/');
      if (response.statusCode == 200) {
        log('fetching.................');
        final List<dynamic> jsondata = response.data;
        return jsondata.map((json) => UserrModel.fromJson(json)).toList();
      } else {
        throw Exception('unable to load data');
      }
    } catch (e) {
      throw Exception('Erorr$e');
    }
  }
}

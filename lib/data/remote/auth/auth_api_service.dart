import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class AuthApiService {
  final Dio dio;

  AuthApiService({@required this.dio});

  Future<Response<String>> login() async {
    return await dio.get('path');
  }
}
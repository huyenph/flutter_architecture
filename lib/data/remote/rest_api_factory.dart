import 'package:dio/dio.dart';
import 'package:flutterarchitecture/core/app_config.dart';
import 'package:flutterarchitecture/data/local/shared_preferences_manager.dart';
import 'package:flutterarchitecture/data/remote/auth/auth_api_service.dart';
import 'package:flutterarchitecture/data/remote/question/question_api_service.dart';

abstract class RestApiFactoryListener {
  void onResponse(Response response);

  void onError(DioError error);
}

class RestApiFactory {
  static const int TIME_OUT = 5000;

  static Dio _dio;

  final SharedPreferencesManager _prefsManager;
  final RestApiFactoryListener _listener;

  RestApiFactory(this._prefsManager, this._listener);

  AuthApiService provideAuthApi() {
    final dio = _createDioClient();
    return AuthApiService(dio: dio);
  }

  QuestionApiService provideQuestionApi() {
    final dio = _createDioClient();
    return QuestionApiService(dio: dio);
  }

  Dio _createDioClient() {
    if (_dio == null) {
      _dio = Dio();
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            return await requestInterceptor(options);
          },
          onResponse: (Response response) async {
            print(response);
            return _listener.onResponse(response);
          },
          onError: (DioError error) async {
            print(error.type);
            return _listener.onError(error);
          },
        ),
      );
      _dio.interceptors.add(
        LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }
    return _dio;
  }

  dynamic requestInterceptor(RequestOptions options) async {
    final token = await _prefsManager.token;
    Map<String, String> headers;
    if (token != null) {
      headers = {
        'Content-type': 'Application/json',
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
      };
    } else {
      headers = {
        'Content-type': 'Application/json',
        'Accept': '*/*',
      };
    }
    options.baseUrl = AppConfig.instance.rootUrl();
    options.headers.addAll(headers);
    options.connectTimeout = TIME_OUT;
    options.receiveTimeout = TIME_OUT;
    return options;
  }
}

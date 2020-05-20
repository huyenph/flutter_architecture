import 'package:dio/dio.dart';
import 'package:flutterarchitecture/core/app_config.dart';
import 'package:flutterarchitecture/data/local/shared_preferences_manager.dart';
import 'package:flutterarchitecture/data/remote/auth/auth_api_service.dart';

abstract class RestApiFactoryListener {
  void onResponse(Response response);

  void onError(DioError error);
}

class RestApiFactory {
  static const int TIME_OUT = 5000;

  final SharedPreferencesManager _prefsManager;
  final RestApiFactoryListener _listener;

  RestApiFactory(this._prefsManager, this._listener);

  AuthApiService provideAuthApi() {
    final dio = _createDioClient();
    return AuthApiService(dio: dio);
  }

  Dio _createDioClient({bool signedIn = true}) {
    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          return requestInterceptor(options, signedIn);
        },
        onResponse: (Response response) async {
          return _listener.onResponse(response);
        },
        onError: (DioError error) async {
          return _listener.onError(error);
        },
      ),
    );
    return dio;
  }

  dynamic requestInterceptor(RequestOptions options, bool signedIn) async {
    Map<String, String> headersToken = {
      'Content-type': 'Application/json',
      'Authorization': 'Bearer ${_prefsManager.token}',
      'Accept': '*/*',
    };
    Map<String, String> headers = {
      'Content-type': 'Application/json',
      'Accept': '*/*',
    };
    options.baseUrl = AppConfig.instance.rootUrl();
    options.headers.addAll(signedIn ? headersToken : headers);
    options.connectTimeout = TIME_OUT;
    options.receiveTimeout = TIME_OUT;
    return options;
  }
}

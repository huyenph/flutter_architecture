import 'package:dio/dio.dart';
import 'package:flutterarchitecture/data/remote/rest_api_factory.dart';
import 'package:flutterarchitecture/data/remote/token_expired_handler.dart';

class HttpHandler implements RestApiFactoryListener {
  final TokenExpiredHandler _tokenExpiredHandler;

  HttpHandler(this._tokenExpiredHandler);

  @override
  void onError(DioError error) {
    switch(error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        print('Connect Timeout: $error');
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        print('Receive Timeout: $error');
        break;
      case DioErrorType.CANCEL:
        print('Cancel: $error');
        break;
      case DioErrorType.RESPONSE:
        print('Response: $error');
        final statusCode = error.response.statusCode;
        if (statusCode == 401 || statusCode == 416) {
          _tokenExpiredHandler.call(statusCode == 401
              ? TokenType.TOKEN_EXPIRED
              : TokenType.ANOTHER_DEVICE);
        } else if(statusCode == 403) {
          print('403');
        }
        break;
      default:
        print('Error default');
        break;
    }

  }

  @override
  void onResponse(Response response) {
    print('onResponse: $response');
  }

//  Future<T> call<T>(Future<Response<T>> requestFuture) async {
//    Response<T> response = await requestFuture.timeout(
//      Duration(seconds: 30),
//      onTimeout: () {},
//    );
//  }
//
//  T _handlerResponse<T>(Response<T> response) {
//    if (response.statusCode == 401 || response.statusCode == 416) {
//      _tokenExpiredHandler.call(response.statusCode == 401
//          ? TokenType.TOKEN_EXPIRED
//          : TokenType.ANOTHER_DEVICE);
//    }
//    if(response.statusCode == 403) {
//
//    }
//  }


}

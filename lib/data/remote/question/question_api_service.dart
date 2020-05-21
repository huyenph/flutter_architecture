import 'package:dio/dio.dart';
import 'package:flutterarchitecture/domain/entities/question/question_response.dart';
import 'package:meta/meta.dart';

class QuestionApiService {
  final Dio dio;

  QuestionApiService({@required this.dio});

  Future<Response<QuestionResponse>> fetchQuestion(
      String order, String sort, String site) async {
    return await dio.get(
      'posts',
      queryParameters: {
        'order': order,
        'sort': sort,
        'site': site,
      },
    );
  }
}

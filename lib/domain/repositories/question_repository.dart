import 'package:flutterarchitecture/domain/entities/question/question_response.dart';

abstract class QuestionRepository {
  Future<QuestionResponse> fetchQuestions(
    String order,
    String sort,
    String site,
  );
}

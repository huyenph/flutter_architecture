import 'package:flutterarchitecture/domain/entities/question/question_response.dart';
import 'package:flutterarchitecture/domain/repositories/question_repository.dart';

class QuestionUseCase {
  final QuestionRepository _questionRepository;

  QuestionUseCase(this._questionRepository);

  Future<QuestionResponse> fetchQuestions(
    String order,
    String sort,
    String site,
  ) =>
      _questionRepository.fetchQuestions(order, sort, site);
}

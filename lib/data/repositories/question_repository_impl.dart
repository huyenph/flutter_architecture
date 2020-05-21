import 'package:dio/dio.dart';
import 'package:flutterarchitecture/data/local/shared_preferences_manager.dart';
import 'package:flutterarchitecture/data/remote/question/question_api_service.dart';
import 'package:flutterarchitecture/domain/entities/question/question_response.dart';
import 'package:flutterarchitecture/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final QuestionApiService _questionApiService;
  final SharedPreferencesManager _prefsManager;

  QuestionRepositoryImpl(this._questionApiService, this._prefsManager);

  @override
  Future<QuestionResponse> fetchQuestions(
      String order, String sort, String site) async {
    Response<QuestionResponse> response =
        await _questionApiService.fetchQuestion(order, sort, site);
    print(response.data);
    return response.data;
  }
}

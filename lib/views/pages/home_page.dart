import 'package:flutter/material.dart';
import 'package:flutterarchitecture/domain/usecases/question_usecase.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<QuestionUseCase>(context)
        .fetchQuestions('desc', 'activity', 'stackoverflow');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutterarchitecture/domain/usecases/question_usecase.dart';
import 'package:flutterarchitecture/views/base/base_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<QuestionUseCase>(context)
        .fetchQuestions('desc', 'activity', 'stackoverflow');
  }

  @override
  Widget buildBody() {
    return Center(
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, 'a'),
        child: Text('click me'),
      ),
    );
  }

  @override
  void onShowLoading(String text) {
    // TODO: implement onShowLoading
  }
}

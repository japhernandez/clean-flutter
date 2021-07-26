import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_flutter/UI/components/surveys/survey_items.dart';
import 'package:clean_flutter/UI/helpers/surveys/survey_presenter.dart';
import 'package:clean_flutter/UI/helpers/surveys/survey_view_model.dart';
import 'package:clean_flutter/UI/state/survey/mixins/loading_manager.dart';

class SurveyPage extends StatelessWidget with LoadingManager {
  final SurveyPresenter presenter;

  SurveyPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surveys')),
      body: Builder(
        builder: (context) {
          // handleLoading(context, isLoadingStream);
          presenter.loadData();

          return StreamBuilder<List<SurveyViewModel>>(
            stream: presenter.surveysStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error);
              }

              if (snapshot.hasData) {
                return Provider(
                  create: (_) => presenter,
                  child: SurveyItems(snapshot.data),
                );
              }

              return SizedBox(height: 0);
            },
          );
        },
      ),
    );
  }
}

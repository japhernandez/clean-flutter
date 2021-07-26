import 'package:clean_flutter/UI/state/survey/presenters/loading_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:clean_flutter/domain/use_case/load_surveys.dart';
import 'package:clean_flutter/UI/helpers/surveys/survey_presenter.dart';
import 'package:clean_flutter/UI/helpers/surveys/survey_view_model.dart';

class GetxSurveyPresenter extends GetxController
    with LoadingManager
    implements SurveyPresenter {
  final LoadSurveys loadSurveys;
  final _surveys = Rx<List<SurveyViewModel>>();

  GetxSurveyPresenter({@required this.loadSurveys});

  Stream<List<SurveyViewModel>> get surveysStream => _surveys.stream;

  Future<void> loadData() async {
    try {
      isLoading = true;
      final surveys = await loadSurveys.load();
      _surveys.value = surveys
          .map((survey) => SurveyViewModel(
              question: survey.question,
              date: survey.date,
              didAnswer: survey.didAnswer))
          .toList();
    } catch (error) {
      print('Error Presenter => $error');
    } finally {
      isLoading = false;
    }
  }
}

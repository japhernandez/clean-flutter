import 'package:clean_flutter/UI/helpers/surveys/survey_view_model.dart';

abstract class SurveyPresenter {
  Stream<List<SurveyViewModel>> get surveysStream;
  Future<void> loadData();
}

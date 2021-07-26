import 'package:clean_flutter/domain/entities/survey_entity.dart';

abstract class LoadSurveys {
  Future<List<SurveyEntity>> load();
}

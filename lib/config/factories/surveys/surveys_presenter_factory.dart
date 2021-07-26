import 'package:clean_flutter/UI/helpers/surveys/survey_presenter.dart';
import 'package:clean_flutter/UI/state/survey/presenters/surveys_presenter.dart';
import 'package:clean_flutter/infrastructure/entry_points/surveys_load_factory.dart';

SurveyPresenter makeGetxSurveysPresenter() =>
    GetxSurveyPresenter(loadSurveys: makeRemoteLoadSurveys());

import 'package:clean_flutter/UI/pages/survey_page.dart';
import 'package:clean_flutter/config/factories/surveys/surveys_presenter_factory.dart';
import 'package:flutter/material.dart';

Widget makeSurveysPage() => SurveyPage(makeGetxSurveysPresenter());

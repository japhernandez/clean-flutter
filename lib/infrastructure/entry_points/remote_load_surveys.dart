import 'package:clean_flutter/config/models/remote_survey_model.dart';
import 'package:clean_flutter/domain/entities/survey_entity.dart';
import 'package:clean_flutter/domain/use_case/load_surveys.dart';
import 'package:clean_flutter/infrastructure/driver_adapter/http_client.dart';
import 'package:clean_flutter/infrastructure/driver_adapter/http_error.dart';
import 'package:flutter/material.dart';

class RemoteLoadSurveys implements LoadSurveys {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSurveys({
    @required this.url,
    @required this.httpClient,
  });

  // ignore: missing_return
  Future<List<SurveyEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse
          .map<SurveyEntity>(
              (json) => RemoteSurveyModel.fromJson(json).toEntity())
          .toList();
    } on HttpError catch (error) {
      print('Error response => $error');
    }
  }
}

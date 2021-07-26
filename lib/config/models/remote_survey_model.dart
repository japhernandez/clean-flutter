import 'package:clean_flutter/domain/entities/survey_entity.dart';
import 'package:clean_flutter/infrastructure/driver_adapter/http_error.dart';
import 'package:flutter/material.dart';

class RemoteSurveyModel {
  final String question;
  final String date;
  final bool didAnswer;

  RemoteSurveyModel({
    @required this.question,
    @required this.date,
    @required this.didAnswer,
  });

  factory RemoteSurveyModel.fromJson(Map json) {
    // Validamos que la data que llega sea correcta
    if (!json.keys.toSet().containsAll(['question', 'date', 'didAnswer'])) {
      throw HttpError.invalidData;
    }

    return RemoteSurveyModel(
      question: json['question'],
      date: json['date'],
      didAnswer: json['didAnswer'],
    );
  }

  SurveyEntity toEntity() => SurveyEntity(
        question: question,
        date: date,
        didAnswer: didAnswer,
      );
}

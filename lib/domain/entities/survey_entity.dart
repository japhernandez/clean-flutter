import 'package:equatable/equatable.dart';

class SurveyEntity extends Equatable {
  final String question;
  final String date;
  final bool didAnswer;

  SurveyEntity({
    this.question,
    this.date,
    this.didAnswer,
  });

  @override
  List<Object> get props => ['question', 'dateTime', 'didAnswer'];
}

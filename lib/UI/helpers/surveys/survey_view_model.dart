import 'package:equatable/equatable.dart';

///  Implementamos esta [class] para hacer uso en la vista
///  ya que no podemos acceder directamente de la UI al Domain.
/// Es un clone de la entidad [SurveyEntity], asi garantizamos que los datos
/// queden homologados
class SurveyViewModel extends Equatable {
  final String question;
  final String date;
  final bool didAnswer;

  SurveyViewModel({
    this.question,
    this.date,
    this.didAnswer,
  });

  @override
  List<Object> get props => ['question', 'dateTime', 'didAnswer'];
}

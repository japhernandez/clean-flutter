import 'package:flutter/material.dart';
import 'package:clean_flutter/UI/components/surveys/survey_item.dart';
import 'package:clean_flutter/UI/helpers/surveys/survey_view_model.dart';

class SurveyItems extends StatelessWidget {
  final List<SurveyViewModel> viewModels;

  const SurveyItems(this.viewModels);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: viewModels.map((viewModel) => SurveyItem(viewModel)).toList(),
      ),
    );
  }
}

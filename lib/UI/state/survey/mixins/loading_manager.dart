import 'package:clean_flutter/UI/components/mixins/spinner.dart';
import 'package:flutter/widgets.dart';

mixin LoadingManager {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((isLoading) {
      isLoading == true ? showLoading(context) : hideLoading(context);
    });
  }
}

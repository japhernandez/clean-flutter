import 'package:clean_flutter/config/enviroments/api_url_factory.dart';
import 'package:clean_flutter/domain/use_case/load_surveys.dart';
import 'package:clean_flutter/infrastructure/driver_adapter/http_client_factory.dart';
import 'package:clean_flutter/infrastructure/entry_points/remote_load_surveys.dart';

LoadSurveys makeRemoteLoadSurveys() {
  return RemoteLoadSurveys(
      url: makeApiUrl('surveys'), httpClient: makeHttpAdapter());
}

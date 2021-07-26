import 'package:clean_flutter/infrastructure/driver_adapter/http_adapter.dart';
import 'package:http/http.dart';
import 'package:clean_flutter/infrastructure/driver_adapter/http_client.dart';

// Por medio de esta funcion, comunicamos el adaptador y el entry_point
// adaptador [HttpAdapter]
// entry_point [RemoteLoadSurveys]
HttpClient makeHttpAdapter() => HttpAdapter(Client());

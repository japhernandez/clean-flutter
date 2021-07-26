import 'dart:convert';

import 'package:clean_flutter/infrastructure/driver_adapter/http_client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'http_error.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    @required String url,
    @required String method,
    Map body,
    Map headers,
  }) async {
    // Cabeceras para la peticion
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'Content-Type': 'application/json', 'accept': 'application/json'});

    // Hacemos la transformacion de la data que llega en la peticion
    // a formato JSON
    final jsonBody = body != null ? jsonEncode(body) : null;

    // Cuando se recibe un error de servidor o de programacion
    var response = Response('', 500);

    // Respuestas esperadas de forma asincrona
    Future<Response> futureResponse;

    try {
      // Manejo de verbos Http para cada peticion
      switch (method) {
        case 'post':
          futureResponse =
              client.post(url, headers: defaultHeaders, body: jsonBody);
          break;
        case 'get':
          futureResponse = client.get(url, headers: defaultHeaders);
          break;
        default:
      }

      if (futureResponse != null) {
        response = await futureResponse.timeout(Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  // Esta funcion hace el manejo de las respuestas del cliente Http
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}

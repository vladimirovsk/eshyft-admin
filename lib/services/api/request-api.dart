import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final optionsDio = BaseOptions(
  baseUrl: 'https://dev-api.eshyft.com/api/v2',
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 3),
);
final dio = Dio(optionsDio);

Future<Response?> getRequest(String endpoint, String type, [Map<String, dynamic>? params, Map<String, dynamic>? headers] ) async {
  if (headers != null){
    print(headers);
  }

  final response = await dio.request(
    endpoint,
    queryParameters: type.toUpperCase() == 'GET' ? params : null,
    data: type.toUpperCase() != 'GET' ? params : null,
    options: Options(method: type, headers: headers),
  );

  return response;
}


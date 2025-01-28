import 'dart:convert' as convert;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eshyftadmin/models/storage_item.dart';
import 'package:eshyftadmin/services/snack_bar.dart';
import 'package:eshyftadmin/services/storage_service.dart';
import 'package:flutter/material.dart';

import 'request-api.dart';

final StorageService _storageService = StorageService();

Future<Response> authLogin(Map<String, dynamic>? params) async {
    return await getRequest('/auth/login', 'POST', params);
}

Future<Response?> authRefresh(Map<String, dynamic>? params) async {
    return await getRequest('/auth/refresh', 'POST', params);
}

Future<Response?> authProfile(Map<String, dynamic>? params, String accessToken) async {
    final String _accessToken = accessToken;
    final Map<String, dynamic> headers = {
        "Authorization": "Bearer ${_accessToken}",
    };
    return await getRequest('/auth/profile', 'GET', params, headers);
}

Future<void> updateProfile(context, request) async {
    var jsonResponse = convert.jsonDecode(request.toString());
    _storageService.writeSecureData(StorageItem('refreshToken', jsonResponse['refreshToken']));
    _storageService.writeSecureData(StorageItem('accessToken', jsonResponse['accessToken']));

    debugPrint('RESPONSE ${jsonResponse}');
    final accessToken = jsonResponse['accessToken'];
    final _authProfile = await authProfile({}, accessToken);
    _storageService.writeSecureData(StorageItem('profileUser', _authProfile.toString()));
}

import 'dart:convert' as convert;
import 'dart:io';

import 'package:eshyftadmin/models/storage_item.dart';
import 'package:eshyftadmin/services/api/auth-service.dart';
import 'package:eshyftadmin/services/snack_bar.dart';
import 'package:eshyftadmin/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../constants/main.dart';

final log = Logger('StartPageScreen');


class StartPageScreen extends StatefulWidget {
  const StartPageScreen({super.key});

  @override
  _StartPageScreenState createState() => _StartPageScreenState();
}

class _StartPageScreenState extends State<StartPageScreen> {
  late String _refreshToken;
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    _refreshToken = '';//_initRefreshToken();
    readRefreshToken();
    debugPrint("refreshToken: ${_refreshToken}");
  }

  Future<String?> readRefreshToken() async {
    try {
      final result = await _storageService.readSecureData('refreshToken');
      final String token = result as String;
      checkRefreshToken(token);
      return result;
    } catch (Storage){
      Navigator.of(context).pushNamed('/');
    }
    return null;
  }

    Future<void> checkRefreshToken(String token) async {
      try {
        Map<String, String> params = {
          "refreshToken": token
        };
        final response = await authRefresh(params);
        updateProfile(context, response);
        Navigator.of(context).pushNamed('/timecards');

      } catch (e) {
        debugPrint('ERROR checkRefreshToken: $e');
        Navigator.of(context).pushNamed('/');
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Constants.COLOR_START_PAGE_PAPER,
          body: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(child: Image(
                          image: AssetImage(
                              'assets/images/ESHYFT logo_vertical-198.png'),
                        ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          child: Center(
                            child: Text('For ESHYFT Administration',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Ubuntu')),
                          ),
                        ),
                        Text(_refreshToken),
                      ]
                  )
              )
          )
      );
    }
  }

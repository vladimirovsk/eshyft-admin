import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eshyftadmin/models/storage_item.dart';
import 'package:eshyftadmin/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../component/buttons.dart';
import '../constants/main.dart';
import '../services/api/auth-service.dart';
import '../services/snack_bar.dart';

final log = Logger('LoginScreen');

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  final StorageService _storageService = StorageService();
  TextEditingController _emailTextInputController = TextEditingController();
  TextEditingController _passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextInputController.dispose();
    _passwordTextInputController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> signIn() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;
    try {
      final request = await authLogin({
        'email': _emailTextInputController.text.trim(),
        'password': _passwordTextInputController.text.trim(),
        'app': ['web'],
      });

      if (request?.statusCode == 200) {
        _storageService.writeSecureData(StorageItem('email', _emailTextInputController.text.trim()));
        _storageService.writeSecureData(StorageItem('password', _passwordTextInputController.text.trim()));
        await updateProfile(context, request);

        final storedData = await _storageService.readSecureData('profileUser');
        final jsonProfileUser = convert.jsonDecode(storedData.toString());

       if (jsonProfileUser == null ) {

         debugPrint('jsonProfileUser ${jsonProfileUser.toString()}');

         SnackBarService.showSnackBar(context, 'No user access levels', true);
         Navigator.of(context).pushNamed('/');
         throw new Exception('No user access levels');
       };

        Navigator.of(context).pushNamed('/timecards');
      }
    } on DioException {
      SnackBarService.showSnackBar(
          context, 'Incorrect login or password', true);
      print('Incorrect login or password');
    } catch (error) {
      print('getRequest Other Error ${error.toString()}');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.COLOR_PAPER,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Center(

                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Container(
                    child: Image(
                      image: AssetImage(
                          'assets/images/ESHYFT logo_vertical-154.png'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: Center(
                        child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu'),
                    )),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: Center(
                      child: Text('For ESHYFT Administration',
                          style: TextStyle(fontSize: 16, fontFamily: 'Ubuntu')),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      controller: _emailTextInputController,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Incorrect email'
                              : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Email"),
                    ),
                    width: 343,
                    // padding: new EdgeInsets.only(bottom: 20.0),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    child: new TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordTextInputController,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Password",
                          suffix: InkWell(
                              onTap: togglePasswordView,
                              child: Icon(
                                isHiddenPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              )
                          )
                      ),
                      obscureText: isHiddenPassword,
                    ),
                    width: 343.0,
                  ),
                  const SizedBox(height: 50),
                  Container(child: EshyftButton('Sign In', signIn))
                ],
              )),
            )
        )
        )
    );
  }
}

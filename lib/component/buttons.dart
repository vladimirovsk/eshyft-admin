import 'package:eshyftadmin/constants/main.dart';
import 'package:flutter/material.dart';

MaterialButton EshyftButton(text, onClick) {
  return MaterialButton(
  color: Constants.COLOR_ACTION_BUTTON,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30)
    ),
  height: 55.0,
  minWidth: 343.0,
  onPressed: onClick,
  child: Text(text),
  );
}
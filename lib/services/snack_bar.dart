import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarService {
  late AnimationController localAnimationController;

  static Future<void> showSnackBar(
      BuildContext context, String textMessage, bool error) async {
    if (error && textMessage.isNotEmpty) {
      showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            icon: Icon(null),
              maxLines: 1,
            message: textMessage
          )
      );
    }
  }

}
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

mixin MessageSnackBar<T extends StatefulWidget> on State<T> {
  final textStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  void showError(String message) {
    showTopSnackBar(
      curve: Curves.fastOutSlowIn,
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        textStyle: textStyle,
      ),
    );
  }

  void showInfo(String message) {
    showTopSnackBar(
      curve: Curves.fastOutSlowIn,
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
        textStyle: textStyle,
      ),
    );
  }

  void showSuccess(String message) {
    showTopSnackBar(
      curve: Curves.fastOutSlowIn,
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        textStyle: textStyle,
      ),
    );
  }
}

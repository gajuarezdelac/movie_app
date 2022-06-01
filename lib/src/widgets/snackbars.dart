import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void snackbarSuccess(BuildContext context, String message) {
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message: message,
    ),
  );
}

void snackbarInfo(BuildContext context, String message) {
  showTopSnackBar(
    context,
    CustomSnackBar.info(
      message: message,
    ),
  );
}

void snackbarError(BuildContext context, String message) {
  showTopSnackBar(
    context,
    CustomSnackBar.error(
      message: message,
    ),
  );
}

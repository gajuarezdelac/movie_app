import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:movie_app/src/utils/responsive.dart';

// Modal
abstract class Dialogs {
  static alert(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(_);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  static confirm(BuildContext context,
      {required String title,
      required String description,
      Function()? onConfirm}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.pop(_);
            },
          ),
          TextButton(
            child: const Text("Aceptar"),
            onPressed: onConfirm,
          )
        ],
      ),
    );
  }

  static modalConfirmOkOnly(
    BuildContext context, {
    required String title,
    required String description,
    Function()? onConfirm,
    String? buttonText,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            child: buttonText != null && buttonText != ''
                ? Text(buttonText)
                : const Text("OK"),
            onPressed: onConfirm,
          )
        ],
      ),
    );
  }
}

// Loading
abstract class ProgressDialog {
  static show(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            child: Container(
              color: Color.fromARGB(255, 0, 0, 0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: Color.fromARGB(255, 21, 3, 1),
                    padding: EdgeInsets.only(bottom: responsive.dp(4)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/images/loading.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       bottom: 200, left: 100, right: 100),
                  //   child: Container(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Image.asset(
                  //       'assets/images/logo.png',
                  //       // color: Colors.white30,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dissmiss(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  static dissmiss1(BuildContext context) {
    Navigator.pop(context);
  }
}
